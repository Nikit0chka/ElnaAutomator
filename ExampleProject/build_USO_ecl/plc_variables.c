// clang-format off

#include <assert.h>
#include <errno.h>
#include <fcntl.h>
#include <stdbool.h>
#include <stdint.h>
#include <stdio.h>
#include <string.h>
#include <unistd.h>

#include "POUS.h"
#include <beremiz/beremiz.h>

#include "iec_types_all.h"
#include "config1.h"

#ifdef DEBUG_PLC
#define dbg(_PRNTMSG, ...) fprintf(stdout, "[PLC][dbg]:%20s:%d: " _PRNTMSG "\n", __func__, __LINE__, ##__VA_ARGS__)
#else
#define dbg(_PRNTMSG, ...) \
    do {                   \
    } while (0);
#endif // DEBUG_PLC

#ifdef DEBUG_PLC
#define err(_PRNTMSG, ...) fprintf(stderr, "[PLC][err][%s:%d]: " _PRNTMSG "\n", __func__, __LINE__, ##__VA_ARGS__)
#else
#define err(_PRNTMSG, ...) fprintf(stderr, "[PLC][err]: " _PRNTMSG "\n", ##__VA_ARGS__)
#endif // DEBUG_PLC

uint32_t gVars_count = 228;
iec_var_t *gIec_vars = NULL;

extern transfer_type_t g_transfer_type;
static online_transfer_cb *cb;
extern brzrte_callbacks_t *g_callbacks;

#define __Unpack_case_t(TYPENAME) \
    case TYPENAME##_ENUM :\
        *value_p = &((__IEC_##TYPENAME##_t *)varp)->value;\
        *flags = &((__IEC_##TYPENAME##_t *)varp)->flags;\
        break;
#define __Unpack_case_p(TYPENAME)\
    case TYPENAME##_O_ENUM :\
    case TYPENAME##_P_ENUM :\
        *flags = &((__IEC_##TYPENAME##_p *)varp)->flags;\
        *value_p = ((__IEC_##TYPENAME##_p *)varp)->value;\
        *f_value_p = &((__IEC_##TYPENAME##_p *)varp)->fvalue;\
        break;

/** @brief Unpack variable values */
void UnpackVar(void* varp, __IEC_types_enum vartype, void **value_p, void **f_value_p, uint8_t **flags)
{
    *f_value_p = NULL;
    *flags = NULL;

    /* Find data to copy*/
    switch(vartype)
    {
        __ANY(__Unpack_case_t)
        __ANY(__Unpack_case_p)
    default:
        break;
    }
}


iec_var_t *getVariable(uint32_t idx) {
    if (gIec_vars == NULL)
        return NULL;
    if (idx >= gVars_count)
        return NULL;
    return &gIec_vars[idx];
}

uint32_t getVariablesCount(){
    return gVars_count;
}

int __variables_init_PROGRAM0();
int __variables_init_();

#define CALL_FUNC_INIT(__FU__) \
    if (__FU__ != 0) {\
        err("%s", #__FU__);\
        return -1;\
    }

#define RETAIN_VARIABLES_COUNT 0
static uint32_t retain_idxs[RETAIN_VARIABLES_COUNT] = {
     
};
static retain_binary_t retain_data[RETAIN_VARIABLES_COUNT];
static const char * retain_values_storage_name = "retain_values.bin\0";
static const char * retain_values_storage_name_online = "retain_values_.bin\0";


static bool retain_read_file(){
    FILE *values_file = fopen(retain_values_storage_name, "rb");
    if (values_file == 0) {
        err("Error reading file: %s", retain_values_storage_name);
        return false;
    }

    size_t result = fread(retain_data, sizeof(retain_binary_t), RETAIN_VARIABLES_COUNT, values_file);

    fclose(values_file);

    if (result != RETAIN_VARIABLES_COUNT) {
        err("Incorrect file: %s", retain_values_storage_name);
        return false;
    }
    return true;
}

static void retain_apply_file(){
    int i = 0;
    for (i = 0; i < RETAIN_VARIABLES_COUNT; ++i){
        iec_var_t *st = getVariable(retain_idxs[i]);
        retain_binary_t *data = &retain_data[i];
        memcpy(st->value_p, &data->value, st->size_data);
    }
}

static bool retain_write_file()
{
    FILE *values_file = fopen(retain_values_storage_name, "wb");
    if (values_file == 0) {
        err("Error writing in file: %s", retain_values_storage_name);
        return false;
    }

    size_t result = fwrite(retain_data, sizeof(retain_binary_t), RETAIN_VARIABLES_COUNT, values_file);

    fclose(values_file);

    if (result != RETAIN_VARIABLES_COUNT) {
        err("Error writing in file: %s", retain_values_storage_name);
        return false;
    }
    return true;
}

static bool retain_fill_data(){
    bool need_write = false;
    struct timespec t;
    clock_gettime(CLOCK_REALTIME, &t);

    int i = 0;
    for (i = 0; i < RETAIN_VARIABLES_COUNT; ++i){
        iec_var_t *st = getVariable(retain_idxs[i]);
        retain_binary_t *data = &retain_data[i];
        if (memcmp(st->value_p, &data->value, st->size_data)){
            memcpy(&data->value, st->value_p, st->size_data);
            data->timestamp_sec = t.tv_sec;
            data->timestamp_nsec = t.tv_nsec;
            need_write = true;
        }
    }
    return need_write;
}

int __retain_init(start_args_t *args)
{
    if (!RETAIN_VARIABLES_COUNT)
        return 0;

   if (g_transfer_type)
        rename(retain_values_storage_name_online, retain_values_storage_name);

    if (!retain_read_file())
        return -1;

    if (!g_transfer_type)
        retain_apply_file();

    return 0;
}

void __retain_publish()
{
    if (!RETAIN_VARIABLES_COUNT)
        return;

    if (retain_fill_data()) // found some changes
        retain_write_file();
}

#define ONLINE_TRANSFER_VARIABLES_COUNT 228
static uint32_t online_transfer_idxs[ONLINE_TRANSFER_VARIABLES_COUNT] = {
        0 // PROGRAM0.VAR0
    ,  45 // RESOURCE1.A1_10_ERR_MODE
    ,  46 // RESOURCE1.A1_11_ERR_MODE
    ,  47 // RESOURCE1.A1_12_ERR_MODE
    ,  48 // RESOURCE1.A1_13_ERR_MODE
    ,  49 // RESOURCE1.A1_14_ERR_MODE
    ,  50 // RESOURCE1.A1_15_ERR_MODE
    ,  51 // RESOURCE1.A1_1_ERR_MODE
    ,  52 // RESOURCE1.A1_2_ERR_MODE
    ,  53 // RESOURCE1.A1_3_ERR_MODE
    ,  54 // RESOURCE1.A1_4_ERR_MODE
    ,  55 // RESOURCE1.A1_5_ERR_MODE
    ,  56 // RESOURCE1.A1_6_ERR_MODE
    ,  57 // RESOURCE1.A1_7_ERR_MODE
    ,  58 // RESOURCE1.A1_8_ERR_MODE
    ,  59 // RESOURCE1.A1_9_ERR_MODE
    ,  60 // RESOURCE1.A2_10_ERR_MODE
    ,  61 // RESOURCE1.A2_11_ERR_MODE
    ,  62 // RESOURCE1.A2_12_ERR_MODE
    ,  63 // RESOURCE1.A2_13_ERR_MODE
    ,  64 // RESOURCE1.A2_14_ERR_MODE
    ,  65 // RESOURCE1.A2_15_ERR_MODE
    ,  66 // RESOURCE1.A2_1_ERR_MODE
    ,  67 // RESOURCE1.A2_2_ERR_MODE
    ,  68 // RESOURCE1.A2_3_ERR_MODE
    ,  69 // RESOURCE1.A2_4_ERR_MODE
    ,  70 // RESOURCE1.A2_5_ERR_MODE
    ,  71 // RESOURCE1.A2_6_ERR_MODE
    ,  72 // RESOURCE1.A2_7_ERR_MODE
    ,  73 // RESOURCE1.A2_8_ERR_MODE
    ,  74 // RESOURCE1.A2_9_ERR_MODE
    ,  75 // RESOURCE1.AI_0_DBLVALUE
    ,  76 // RESOURCE1.AI_10_DBLVALUE
    ,  77 // RESOURCE1.AI_11_DBLVALUE
    ,  78 // RESOURCE1.AI_12_DBLVALUE
    ,  79 // RESOURCE1.AI_13_DBLVALUE
    ,  80 // RESOURCE1.AI_14_DBLVALUE
    ,  81 // RESOURCE1.AI_15_DBLVALUE
    ,  82 // RESOURCE1.AI_16_DBLVALUE
    ,  83 // RESOURCE1.AI_17_DBLVALUE
    ,  84 // RESOURCE1.AI_18_DBLVALUE
    ,  85 // RESOURCE1.AI_19_DBLVALUE
    ,  86 // RESOURCE1.AI_1_DBLVALUE
    ,  87 // RESOURCE1.AI_20_DBLVALUE
    ,  88 // RESOURCE1.AI_21_DBLVALUE
    ,  89 // RESOURCE1.AI_22_DBLVALUE
    ,  90 // RESOURCE1.AI_23_DBLVALUE
    ,  91 // RESOURCE1.AI_24_DBLVALUE
    ,  92 // RESOURCE1.AI_25_DBLVALUE
    ,  93 // RESOURCE1.AI_26_DBLVALUE
    ,  94 // RESOURCE1.AI_27_DBLVALUE
    ,  95 // RESOURCE1.AI_28_DBLVALUE
    ,  96 // RESOURCE1.AI_29_DBLVALUE
    ,  97 // RESOURCE1.AI_2_DBLVALUE
    ,  98 // RESOURCE1.AI_30_DBLVALUE
    ,  99 // RESOURCE1.AI_31_DBLVALUE
    , 100 // RESOURCE1.AI_32_DBLVALUE
    , 101 // RESOURCE1.AI_33_DBLVALUE
    , 102 // RESOURCE1.AI_34_DBLVALUE
    , 103 // RESOURCE1.AI_35_DBLVALUE
    , 104 // RESOURCE1.AI_36_DBLVALUE
    , 105 // RESOURCE1.AI_37_DBLVALUE
    , 106 // RESOURCE1.AI_38_DBLVALUE
    , 107 // RESOURCE1.AI_39_DBLVALUE
    , 108 // RESOURCE1.AI_3_DBLVALUE
    , 109 // RESOURCE1.AI_40_DBLVALUE
    , 110 // RESOURCE1.AI_41_DBLVALUE
    , 111 // RESOURCE1.AI_42_DBLVALUE
    , 112 // RESOURCE1.AI_43_DBLVALUE
    , 113 // RESOURCE1.AI_44_DBLVALUE
    , 114 // RESOURCE1.AI_45_DBLVALUE
    , 115 // RESOURCE1.AI_46_DBLVALUE
    , 116 // RESOURCE1.AI_47_DBLVALUE
    , 117 // RESOURCE1.AI_48_DBLVALUE
    , 118 // RESOURCE1.AI_49_DBLVALUE
    , 119 // RESOURCE1.AI_4_DBLVALUE
    , 120 // RESOURCE1.AI_50_DBLVALUE
    , 121 // RESOURCE1.AI_51_DBLVALUE
    , 122 // RESOURCE1.AI_52_DBLVALUE
    , 123 // RESOURCE1.AI_53_DBLVALUE
    , 124 // RESOURCE1.AI_54_DBLVALUE
    , 125 // RESOURCE1.AI_55_DBLVALUE
    , 126 // RESOURCE1.AI_56_DBLVALUE
    , 127 // RESOURCE1.AI_57_DBLVALUE
    , 128 // RESOURCE1.AI_58_DBLVALUE
    , 129 // RESOURCE1.AI_59_DBLVALUE
    , 130 // RESOURCE1.AI_5_DBLVALUE
    , 131 // RESOURCE1.AI_60_DBLVALUE
    , 132 // RESOURCE1.AI_61_DBLVALUE
    , 133 // RESOURCE1.AI_62_DBLVALUE
    , 134 // RESOURCE1.AI_63_DBLVALUE
    , 135 // RESOURCE1.AI_64_DBLVALUE
    , 136 // RESOURCE1.AI_65_DBLVALUE
    , 137 // RESOURCE1.AI_66_DBLVALUE
    , 138 // RESOURCE1.AI_67_DBLVALUE
    , 139 // RESOURCE1.AI_68_DBLVALUE
    , 140 // RESOURCE1.AI_69_DBLVALUE
    , 141 // RESOURCE1.AI_6_DBLVALUE
    , 142 // RESOURCE1.AI_70_DBLVALUE
    , 143 // RESOURCE1.AI_71_DBLVALUE
    , 144 // RESOURCE1.AI_72_DBLVALUE
    , 145 // RESOURCE1.AI_73_DBLVALUE
    , 146 // RESOURCE1.AI_74_DBLVALUE
    , 147 // RESOURCE1.AI_75_DBLVALUE
    , 148 // RESOURCE1.AI_76_DBLVALUE
    , 149 // RESOURCE1.AI_77_DBLVALUE
    , 150 // RESOURCE1.AI_78_DBLVALUE
    , 151 // RESOURCE1.AI_79_DBLVALUE
    , 152 // RESOURCE1.AI_7_DBLVALUE
    , 153 // RESOURCE1.AI_8_DBLVALUE
    , 154 // RESOURCE1.AI_9_DBLVALUE
    ,  21 // RESOURCE1.AI_A1_COMMAND
    ,  15 // RESOURCE1.AI_A1_HA
    ,  16 // RESOURCE1.AI_A1_HL
    ,  17 // RESOURCE1.AI_A1_HW
    ,  18 // RESOURCE1.AI_A1_LA
    ,  19 // RESOURCE1.AI_A1_LL
    ,  20 // RESOURCE1.AI_A1_LW
    ,  22 // RESOURCE1.AI_A1_NEWHA
    ,  23 // RESOURCE1.AI_A1_NEWHL
    ,  24 // RESOURCE1.AI_A1_NEWHW
    ,  25 // RESOURCE1.AI_A1_NEWLA
    ,  26 // RESOURCE1.AI_A1_NEWLL
    ,  27 // RESOURCE1.AI_A1_NEWLW
    ,  28 // RESOURCE1.AI_A1_STATUS
    ,  29 // RESOURCE1.AI_A1_VALUE
    ,  36 // RESOURCE1.AI_A2_COMMAND
    ,  30 // RESOURCE1.AI_A2_HA
    ,  31 // RESOURCE1.AI_A2_HL
    ,  32 // RESOURCE1.AI_A2_HW
    ,  33 // RESOURCE1.AI_A2_LA
    ,  34 // RESOURCE1.AI_A2_LL
    ,  35 // RESOURCE1.AI_A2_LW
    ,  37 // RESOURCE1.AI_A2_NEWHA
    ,  38 // RESOURCE1.AI_A2_NEWHL
    ,  39 // RESOURCE1.AI_A2_NEWHW
    ,  40 // RESOURCE1.AI_A2_NEWLA
    ,  41 // RESOURCE1.AI_A2_NEWLL
    ,  42 // RESOURCE1.AI_A2_NEWLW
    ,  43 // RESOURCE1.AI_A2_STATUS
    ,  44 // RESOURCE1.AI_A2_VALUE
    , 155 // RESOURCE1.BS_CORE1
    , 156 // RESOURCE1.BS_CORE2
    , 157 // RESOURCE1.BS_CORE3
    , 158 // RESOURCE1.BS_CORE4
    , 159 // RESOURCE1.BS_FREEMEMORY
    , 160 // RESOURCE1.BS_TEMP1
    , 161 // RESOURCE1.BS_TEMP2
    ,   2 // RESOURCE1.CUR_CYCLE
    ,  12 // RESOURCE1.DEL_T
    , 162 // RESOURCE1.DI_0_1_WVALUE
    , 163 // RESOURCE1.DI_10_11_WVALUE
    , 164 // RESOURCE1.DI_12_13_WVALUE
    , 165 // RESOURCE1.DI_14_15_WVALUE
    , 166 // RESOURCE1.DI_16_17_WVALUE
    , 167 // RESOURCE1.DI_18_19_WVALUE
    , 168 // RESOURCE1.DI_20_21_WVALUE
    , 169 // RESOURCE1.DI_2_3_WVALUE
    , 170 // RESOURCE1.DI_4_5_WVALUE
    , 171 // RESOURCE1.DI_6_7_WVALUE
    , 172 // RESOURCE1.DI_8_9_WVALUE
    , 173 // RESOURCE1.DO_0_WVALUE
    , 174 // RESOURCE1.DO_1_WVALUE
    , 175 // RESOURCE1.DO_2_WVALUE
    , 176 // RESOURCE1.DO_3_WVALUE
    , 177 // RESOURCE1.DO_4_WVALUE
    , 178 // RESOURCE1.DO_5_WVALUE
    ,   5 // RESOURCE1.GF_T_100MSEC
    ,  10 // RESOURCE1.GF_T_1MIN
    ,   7 // RESOURCE1.GF_T_1SEC
    ,   1 // RESOURCE1.GMAINT_TIME
    ,   9 // RESOURCE1.GR_T_1MIN
    ,   3 // RESOURCE1.GSTART_TMR
    ,   8 // RESOURCE1.GT_1MIN
    ,   6 // RESOURCE1.GT_1SEC
    , 179 // RESOURCE1.IM_AVOM1_INCOMMAND_ARM
    , 180 // RESOURCE1.IM_AVOM1_STATUS
    , 181 // RESOURCE1.IM_AVOM2_INCOMMAND_ARM
    , 182 // RESOURCE1.IM_AVOM2_STATUS
    , 183 // RESOURCE1.IM_AVOM3_INCOMMAND_ARM
    , 184 // RESOURCE1.IM_AVOM3_STATUS
    , 185 // RESOURCE1.IM_AVOM4_INCOMMAND_ARM
    , 186 // RESOURCE1.IM_AVOM4_STATUS
    , 187 // RESOURCE1.IM_KRAN1_INCOMMAND_ARM
    , 188 // RESOURCE1.IM_KRAN1_STATUS
    , 189 // RESOURCE1.IM_KRAN2_INCOMMAND_ARM
    , 190 // RESOURCE1.IM_KRAN2_STATUS
    , 191 // RESOURCE1.IM_KRAN3_INCOMMAND_ARM
    , 192 // RESOURCE1.IM_KRAN3_STATUS
    , 193 // RESOURCE1.IM_KRAN4_INCOMMAND_ARM
    , 194 // RESOURCE1.IM_KRAN4_STATUS
    , 195 // RESOURCE1.IM_MV_INCOMMAND_ARM
    , 196 // RESOURCE1.IM_MV_STATUS
    , 197 // RESOURCE1.IM_NU2_INCOMMAND_ARM
    , 198 // RESOURCE1.IM_NU2_STATUS
    , 199 // RESOURCE1.IM_NU_INCOMMAND_ARM
    , 200 // RESOURCE1.IM_NU_STATUS
    , 201 // RESOURCE1.IM_SECTIONSWITCH1_INCOMMAND_ARM
    , 202 // RESOURCE1.IM_SECTIONSWITCH1_STATUS
    , 203 // RESOURCE1.IM_SINGLESIGNALS_SI0_STATUS
    , 204 // RESOURCE1.IM_SINGLESIGNALS_SI1_STATUS
    , 205 // RESOURCE1.IM_SINGLESIGNALS_SI2_STATUS
    , 206 // RESOURCE1.IM_SINGLESIGNALS_SI3_STATUS
    , 207 // RESOURCE1.IM_SINGLESIGNALS_SI4_STATUS
    , 208 // RESOURCE1.IM_SINGLESIGNALS_SI5_STATUS
    , 209 // RESOURCE1.IM_SINGLESIGNALS_SI6_STATUS
    ,  13 // RESOURCE1.NOTHASREZERVNU
    , 210 // RESOURCE1.PROTECTIONS_AIP1_INCOMMAND_ARM
    , 211 // RESOURCE1.PROTECTIONS_AIP1_STATUS
    , 212 // RESOURCE1.PROTECTIONS_AIP2_INCOMMAND_ARM
    , 213 // RESOURCE1.PROTECTIONS_AIP2_STATUS
    , 214 // RESOURCE1.PROTECTIONS_AIP3_INCOMMAND_ARM
    , 215 // RESOURCE1.PROTECTIONS_AIP3_STATUS
    , 216 // RESOURCE1.PROTECTIONS_AP1_INCOMMAND_ARM
    , 217 // RESOURCE1.PROTECTIONS_AP1_STATUS
    , 218 // RESOURCE1.PROTECTIONS_DIP1_INCOMMAND_ARM
    , 219 // RESOURCE1.PROTECTIONS_DIP1_STATUS
    , 220 // RESOURCE1.PROTECTIONS_DIP2_INCOMMAND_ARM
    , 221 // RESOURCE1.PROTECTIONS_DIP2_STATUS
    , 222 // RESOURCE1.PROTECTIONS_DIP3_INCOMMAND_ARM
    , 223 // RESOURCE1.PROTECTIONS_DIP3_STATUS
    , 224 // RESOURCE1.PROTECTIONS_DIP4_INCOMMAND_ARM
    , 225 // RESOURCE1.PROTECTIONS_DIP4_STATUS
    , 226 // RESOURCE1.PROTECTIONS_DIP5_INCOMMAND_ARM
    , 227 // RESOURCE1.PROTECTIONS_DIP5_STATUS
    ,   4 // RESOURCE1.REQ_CYCLE
    ,  14 // RESOURCE1.RESET_HASNU
    ,  11 // RESOURCE1.T_1SEC
};



static bool online_transfer_prepare_save(){
    online_transfer_variable_t **save_data = cb->getVarsPtr();

    *save_data = malloc(sizeof(online_transfer_variable_t) * ONLINE_TRANSFER_VARIABLES_COUNT);

    uint32_t i = 0;
    for (i = 0; i < ONLINE_TRANSFER_VARIABLES_COUNT; ++i){
        uint32_t var_idx = online_transfer_idxs[i];
        iec_var_t *st = getVariable(var_idx);
        online_transfer_variable_t *data = &(*save_data)[i];

        if ((data->value = malloc(st->size_data)) == NULL)
            return false;

        memcpy(&data->IEC_TYPE, st->IEC_TYPE, 10);
        memcpy(&data->IEC_VAR_PATH, st->IEC_VAR_NAME, IEC_VAR_NAME_LENGTH);
    }
    cb->setVarsCnt(ONLINE_TRANSFER_VARIABLES_COUNT);
    return true;
}

static bool online_transfer_save(){
    online_transfer_variable_t **save_data = cb->getVarsPtr();

    uint32_t i = 0;
    iec_var_t *st;
    online_transfer_variable_t *data;
    for (i = 0; i < ONLINE_TRANSFER_VARIABLES_COUNT; ++i){
        st = getVariable(online_transfer_idxs[i]);
        data = &(*save_data)[i];
        memcpy(data->value, st->value_p, st->size_data);
    }
    return true;
}

static bool online_transfer_load() {
    online_transfer_variable_t **load_data = cb->getVarsPtr();

    if (load_data == NULL) {
        err("Error opening container with previous variables");
        return false;
    }

    int vars_cnt = cb->getVarsCnt();
    if (vars_cnt == 0) {
        err("Error opening container with previous variables");
        return false;
    }

    int i = 0;
    int j = 0;


    for (i = 0; i < vars_cnt; ++i) {
        online_transfer_variable_t *data = &(*load_data)[i];
        if (data->value == NULL){
            err("Error opening container with previous variables. Variable %d is corrupted", i);
            return false;
        }

        if (g_transfer_type == ONLINE) {
            iec_var_t *st = getVariable(online_transfer_idxs[i]);
            memcpy(st->value_p, data->value, st->size_data);
            free(data->value);
        } else {
            for (j = 0; j < gVars_count; ++j){
                iec_var_t *st = getVariable(j);
                if (
                    (!strcmp(st->IEC_VAR_NAME, data->IEC_VAR_PATH)) &&
                    (!strcmp(st->IEC_TYPE, data->IEC_TYPE)))
                {
                    memcpy(st->value_p, data->value, st->size_data);
                    free(data->value);
                    break;
                }
            }
        }
    }
    cb->setVarsCnt(0);
    free(*load_data);

    return true;
}

static program_metadata_t metadata = {
    .header = {
        .pous_count =           65,
        .variables_count =      66,
        .datatypes_count =      33,
        .modules_count =        3,
        .name =                 "ZRU",
        .productName =          "Unnamed",
        .companyName =          "Unknown",
        .productVersion =       "1",
        .modificationDateTime = "2023-11-24T11:54:48",
        .creationDateTime =     "2023-04-06T10:03:41",
    },

    .pous = {
        {"AnyAnalogsNs", "c5c5477502ca260dede835f1671c6fca"},
        {"AnyAnalogsPs", "9bd2450356926943782ef5e9fb03fb5f"},
        {"AnyDiscretNs", "ac61fcbd2388b6e6606fb6fa550b77e8"},
        {"AnyDiscretPs", "cf6dec14acc025fcb3b47e568841231c"},
        {"AnyProtectionInRemont", "268f529b9ba123c887a19792f55fd79c"},
        {"AnyProtectionSignaling", "2a0568cae94c60f3c7bfd0e5016a5259"},
        {"AutoRunProtections", "ffc2a218318c7d08ff28a603705fac7c"},
        {"BlockAllIm", "1de8d621845a6fce4e6eb74a4dec2322"},
        {"BlockAllProtections", "ae7f89c658219618ea41b30b39422018"},
        {"DIwValue_Diag", "31d98071de4afc592b70c131a96a348c"},
        {"DisableAiLimits", "64d8c187eec8f039c04923d4bffde41a"},
        {"EnableAiLimits", "df8278ab29cf4c3ed63c6c0ce664f00c"},
        {"NsCepeiControl", "2d93648752149bc26b7b8f468be3405b"},
        {"NsCepeiUpravlenya", "afb6131ab1c62ebbbdaf7ccc7e7a3da9"},
        {"Opc_Ai_get", "1a601ab8bc2ea65dec91144ba1c468a1"},
        {"Opc_Ai_init", "b6071f234cf4f5468f5aaab1abe5e178"},
        {"Opc_Ai_set", "d35ff4e49557429854fd9d858b599f48"},
        {"Opc_Im_get", "62c1deff3c698050574740c09c761ab7"},
        {"Opc_Im_set", "7142c8779c81e083781b7dc96a3b50ae"},
        {"Opc_Protections_get", "5bd5a73de6bd67fa04bcfca102f6fbc4"},
        {"Opc_Protections_set", "21649eafc306aacc6a211acf4028b568"},
        {"Proc_Ai", "1e65eb3af63242c0b77274d82ded28be"},
        {"Proc_Ai_Init", "102e313489af24162bf40a5ee5b476d9"},
        {"Proc_Di", "2436569b5edd726afac7874715b7d876"},
        {"Proc_Di_Init", "79dfe88b8e6e48a7f840ec2cae8cdabc"},
        {"Proc_Do", "84afa5ccf6dc3d93dcfcc315ecd9e14c"},
        {"Proc_Do_Init", "bfa0f4a67c22b1149d7d529dc97153a2"},
        {"Proc_Im", "78758f1e81ba4023e40911b93253ec53"},
        {"Proc_Im_Init", "68ae44822110b851469fd19a1b5065fc"},
        {"Proc_Protection", "93e9395cdcfaa5099bf37e9d9727a2d4"},
        {"Proc_Protections_Init", "1f431588d12d7f371e635f3c1b46e0eb"},
        {"RemontAllProtections", "e32ccb2cc4270049a08388250289d1b7"},
        {"ResetAllProtections", "eda3ab973896da2caa6f0f3615370c08"},
        {"ResetAllSignaling", "c1fc6af8c3082139e438eefe2c4c3185"},
        {"TwoUint_To_UDINT", "a676850b1d20c61e051d1077cdd20d1b"},
        {"UnBlockAllIm", "48643045de6177217ab17b4ffb4069f7"},
        {"UnBlockAllProtections", "aa3939ab124526f1588d4ef654e0ad22"},
        {"fb_AI_Init", "0f41f2d02b2d7470306e774cbf6f7e6c"},
        {"fb_AiProtection", "4209849643bffac19413ccd0adc4a4a1"},
        {"fb_AiProtection_Init", "67db578fcd7db2ecf4c9c657187ab9c6"},
        {"fb_AiSourceMlp", "a1255f1d8f79ebf65209849ee9a536b5"},
        {"fb_DI_Init", "0d23acbbd9bc180d7f437bfb2c0da334"},
        {"fb_DOSourceMlp", "e2c1f1e877b661e67b31cc9cd0496cc7"},
        {"fb_DO_Init", "75eceeee05695c5e834a7f85cc7da4b3"},
        {"fb_DiProtection", "7b096fb09bf3f9b7aada8211c2d86699"},
        {"fb_DiProtection_Init", "eab79846f10fa32fbc236d85338f27ac"},
        {"fb_DiSourceMlp", "d948b6ab100ac65ccaa00c9adab93c28"},
        {"fb_Kran", "950030447be21665a9119776eef792b3"},
        {"fb_Kran_Init", "2f06f0c55adf9bbdf4a7b73c7a991a92"},
        {"fb_OilPump", "5c2595bcec3428eccd53b8d0784a16a4"},
        {"fb_OilPump_Init", "4a2045a292ef0c496e14a1fadb2f4fd4"},
        {"fb_SectionSwitch", "941c0e44e8a2c38c92e093e08184d01f"},
        {"fb_SectionSwitch_Init", "3e1494b8532cf7a767f45f7355e42cf1"},
        {"fb_Switch", "c61cdb64057b0d8a92d3c5f018fc1abd"},
        {"fb_Switch_Init", "40769ce8c876a32b015ed10c8715eca1"},
        {"fb_singleOutput", "7ae012f26e7602ed445bf0ae6d5a1137"},
        {"fb_singleOutput_Init", "986b2e9eb345ee17a02a4aeb4ac10ff3"},
        {"fb_singleSignal", "4adbe79b0d284f05251aab9ae95261e9"},
        {"fb_singleSignal_Init", "2b3842d3a5f2edf43ade83398309338c"},
        {"fb_sunpackerCommand", "359b34d2b0afc126d38e25d755bbfe6b"},
        {"program0", "7bda23923f5905b144c1d0197e38b9d7"},
        {"resetAiProtection", "6dcf28aa229e9beee0965a57a199e78b"},
        {"resetDiProtection", "6dcf28aa229e9beee0965a57a199e78b"},
        {"runAiProtection", "c0c52739912587a475e7b1e26ce30de3"},
        {"runDiProtection", "c0c52739912587a475e7b1e26ce30de3"}
    },
    .variables = {
        {" resource1", "d64c71220c146287926166ecab45400b"},
        {"AnyAnalogsNs", "ddbb7b45eec0344b6f23572795a4cd23"},
        {"AnyAnalogsPs", "ddbb7b45eec0344b6f23572795a4cd23"},
        {"AnyDiscretNs", "f6ac6c7e50e1d6ef1529fd6f11f5fdac"},
        {"AnyDiscretPs", "eeb71f448a8a178b7ff6558004215acb"},
        {"AnyProtectionInRemont", "443cc8488984468fbd75726078fceb09"},
        {"AnyProtectionSignaling", "443cc8488984468fbd75726078fceb09"},
        {"AutoRunProtections", "ff471476233f7a6c857f544095fd92a8"},
        {"BlockAllIm", "46cd4a1c92a8a840235bf552afa5479a"},
        {"BlockAllProtections", "ff471476233f7a6c857f544095fd92a8"},
        {"DIwValue_Diag", "4040070575512a9fcc57783a6a926f27"},
        {"DisableAiLimits", "2600a977ab81c1069b5ae6b1a33d7320"},
        {"EnableAiLimits", "2600a977ab81c1069b5ae6b1a33d7320"},
        {"NsCepeiControl", "2b2e780a11267bc5f1847797daf47ac7"},
        {"NsCepeiUpravlenya", "2b2e780a11267bc5f1847797daf47ac7"},
        {"Opc_Ai_get", "2c2915feedab123635f40b2b9042d76f"},
        {"Opc_Ai_init", "919c39170206e9257f368f314bc3c97b"},
        {"Opc_Ai_set", "0d7065b7d87eae77df61415163a7648a"},
        {"Opc_Im_get", "cc3900bb09ccc63922b3aa48cb0f71b2"},
        {"Opc_Im_set", "dfd6ca31ab1932f19e8ff3273492b5b1"},
        {"Opc_Protections_get", "0f8739e9c414982f9a206bb104a90117"},
        {"Opc_Protections_set", "110e72be073e05826bd3d7353b5e8685"},
        {"Proc_Ai", "6e96c98e730729ce5790abebceeb33e9"},
        {"Proc_Ai_Init", "9ce17a3c91d306ac0e2a8bcbc2aac1af"},
        {"Proc_Di", "b60979ecac90d0d5f02df36d5b0a58fd"},
        {"Proc_Di_Init", "25ef82dc1df2115bf5f659c26a9aa253"},
        {"Proc_Do", "909a68c0a5b5bafbf3801586ee02ac25"},
        {"Proc_Do_Init", "6fef8e1e009cf5dbdb4260d609b4811a"},
        {"Proc_Im", "db1969d50580fea20441652ab8a6c143"},
        {"Proc_Im_Init", "bd62f41c28978ed00af455fe57163291"},
        {"Proc_Protection", "c92df01a485ede2cfdcae36070015618"},
        {"Proc_Protections_Init", "259c3215468ad15381b0e91521e14c4b"},
        {"RemontAllProtections", "6a2a6a4f71f3fd01f682bf4f2527a44f"},
        {"ResetAllProtections", "ff471476233f7a6c857f544095fd92a8"},
        {"ResetAllSignaling", "ff471476233f7a6c857f544095fd92a8"},
        {"TwoUint_To_UDINT", "5fec2139fcbf7669e8cf2da613e7a069"},
        {"UnBlockAllIm", "46cd4a1c92a8a840235bf552afa5479a"},
        {"UnBlockAllProtections", "ff471476233f7a6c857f544095fd92a8"},
        {"fb_AI_Init", "586f9a23d5c347d5554f81fba28c528a"},
        {"fb_AiProtection", "5ee71ec0a1bd35f24e23bcab74969499"},
        {"fb_AiProtection_Init", "2206aa72acfe2e5eb840db10b6cc5661"},
        {"fb_AiSourceMlp", "fe2c32c957878270cc9fd11c4a9a97e6"},
        {"fb_DI_Init", "2816fd21036e0bf5f44dbe6700f28960"},
        {"fb_DOSourceMlp", "c5b87a3aa51f48e493e77daab912fca4"},
        {"fb_DO_Init", "a886cb514c1876d0234bc483088711ca"},
        {"fb_DiProtection", "dddf000132bf8a563ebe8ebe1f3ab220"},
        {"fb_DiProtection_Init", "a975339a6d105217a5405196e5613152"},
        {"fb_DiSourceMlp", "1e35adbb4176feb97f3722d869ceef9c"},
        {"fb_Kran", "8a8e23e6f1e4f9cccc86d95b30fa49f5"},
        {"fb_Kran_Init", "991c0f7ef5b093f31dce098cdf7d342d"},
        {"fb_OilPump", "d26c748f56b966786bdcd05ac0bf030b"},
        {"fb_OilPump_Init", "fc1e5010926e30b569ab6724948f56e2"},
        {"fb_SectionSwitch", "87c69f5d54e2d7cb6ade7192b255dcae"},
        {"fb_SectionSwitch_Init", "afddb681c4d62af0396e416a193104b5"},
        {"fb_Switch", "ea6b33b07ba2541f80d3150a47b45751"},
        {"fb_Switch_Init", "eb58872212f4faa4e98e8392cb60bf64"},
        {"fb_singleOutput", "bb50ae8cf8bdd27654aeedb6953bd39c"},
        {"fb_singleOutput_Init", "430ca45109521823d6ddbbb94ae6b2de"},
        {"fb_singleSignal", "0c3cceb02fa299b7e1a91c3af5aad851"},
        {"fb_singleSignal_Init", "f69781a832043a7bafaabbd3ddf1c0d7"},
        {"fb_sunpackerCommand", "c54c3b095fb8b4ee5159910e333b0117"},
        {"program0", "6f4b3899b3bef815ed38d488debd898f"},
        {"resetAiProtection", "6e7e7895ff7198eedeb8927b1fb18a48"},
        {"resetDiProtection", "a105f189ea02f5374921e65dee8fb1e6"},
        {"runAiProtection", "9f401020c7ccc9002f252b4c0ca0074a"},
        {"runDiProtection", "d92ec9c90ceda4371f541b04dd72102f"}
    },
    .datatypes = {
        {"AiConfig", "c49423ed3fa36e1c4816a7ee82d0c933"},
        {"DiConfig", "60a29556ce920461b08bae82b6254dff"},
        {"DoConfig", "8a54dd4d9e1b8dbc70bb49a767154551"},
        {"ImConfig", "63f898277061005dd39d46dde77a1719"},
        {"Im_singleOutputs", "6e6985c9f4f3e24aba7dd8594f53e009"},
        {"Im_singleSignals", "ea2c58a9cf0afeb211908fe582b7ca85"},
        {"ProtectionsConfig", "d2d257eddb5bdf11c52be7d604ecb3af"},
        {"TDoubleData", "2d7bd7b6ae0dc763a3ceaf854f9b43c3"},
        {"TItemAIN", "a44f6e28c3ecdc2efc77d145fa76810d"},
        {"TItemDIN", "0ca9abf8e29281dfceeeb568e741c873"},
        {"TWordData", "4bd29d46385997aaeff5ca17fc05cbdc"},
        {"TYPE_AnalogLimitFlags", "c5f85c51897bbd71af98e7299162f9cd"},
        {"TYPE_CommandAnalog", "de1d1720b444e44c884cc4abf7a4a1ca"},
        {"TYPE_ProtectionTags", "07a2f5fa6ed1ad93dfff51923b613807"},
        {"TYPE_ReliableBit", "6809d934b11cbd72ffd98e799a4640bf"},
        {"TYPE_StatusAi", "410718e189d6be139608f2667e8754cf"},
        {"TYPE_basketStats", "f6627c29099f5ca894c073ad54a4cc64"},
        {"TYPE_commandDualInput", "f74f33bc111b6fd8311f24cacaa137b3"},
        {"TYPE_statusDualInput", "0e32747643cd9bc36f96508721dc6ca7"},
        {"struct_AI", "02b1a0fa7277581ac23f3140e3620c08"},
        {"struct_AiProtection", "e0aaf9491a28214ed463d67c29e65368"},
        {"struct_DI", "3178be1fc7748421a70737237b558924"},
        {"struct_DO", "354baa19df5a52766a473319e491bdcd"},
        {"struct_DiProtection", "f3049dcab31c77df65a0f02bbc494436"},
        {"struct_DiscretParametr", "8fbb41ba3f3510482ce427a14c8eb03f"},
        {"struct_Kran", "a2bb4133759ae8513a68c375f1c20dc5"},
        {"struct_OilPump", "2daffb6f24510db3d2d31e100cf0966a"},
        {"struct_ReserveIM", "80fb678584ef6c3801585748139db647"},
        {"struct_ReserveIM2", "4e54f52a147684d0b6a7296e6559b1f5"},
        {"struct_SectionSwitch", "460b9a9550e029d516f7b8facdc852b0"},
        {"struct_Switch", "cb98222cc67b299aa291c27d9f7089a6"},
        {"struct_singleOutput", "8a06eca29c812d7009d6bda5e4456d3e"},
        {"struct_singleSignal", "187db8e9f0ddc82fa54f2111754dfd2c"}
    },
    .modules = {
        {"☑ Redundancy", "~929a88d47e2d9c4f875d520afb541692"},
        {"☒ 0:OPC UA_0", "217e312f938834fec2d48bacd97f53f2"},
        {"☒ 1:elna_0", "61ca28f91a764e2297db32cdde6b2877"}
    },
    .extensions_exists = {
        .modbus = false,
        .smtcp = false,
        .opc_ua = true,
        .elna = true,
        .archiver = false,
        .redundancy = false
    }
};


int startPLC(start_args_t *args);
int stopPLC();
void __run(void);

uint32_t GetMetadataSize(){
    program_metadata_header_t *h = &metadata.header;
    int elems_count = h->pous_count + h->variables_count + h->datatypes_count + h->modules_count;
    return sizeof(program_metadata_header_t) + elems_count * sizeof(program_metadata_elem_t);
}

void GetMetadata(unsigned char *pack_data, program_metadata_header_t *in){
    program_metadata_header_t *h = &metadata.header;
    strcpy(h->library_md5, in->library_md5);
    memcpy(h->version, in->version, sizeof(uint8_t) * 3);
    memcpy(pack_data, &metadata.header, sizeof(program_metadata_header_t));
    int idx = sizeof(program_metadata_header_t);

    int i = 0;

    for (i = 0; i < h->pous_count; ++i){
        memcpy(pack_data + idx, &metadata.pous[i], sizeof(program_metadata_elem_t));
        idx +=  sizeof(program_metadata_elem_t);
    }
    for (i = 0; i < h->variables_count; ++i){
        memcpy(pack_data + idx, &metadata.variables[i], sizeof(program_metadata_elem_t));
        idx +=  sizeof(program_metadata_elem_t);
    }
    for (i = 0; i < h->datatypes_count; ++i){
        memcpy(pack_data + idx, &metadata.datatypes[i], sizeof(program_metadata_elem_t));
        idx +=  sizeof(program_metadata_elem_t);
    }
    for (i = 0; i < h->modules_count; ++i){
        memcpy(pack_data + idx, &metadata.modules[i], sizeof(program_metadata_elem_t));
        idx +=  sizeof(program_metadata_elem_t);
    }
}


int __variables_init(start_args_t *args){
  // executed normally only in OFFLINE
  // when ONLINE requested should be run before loading .so, calling OnlineTransferInitNewLibrary

  // save pointer to callbacks in global ctx

  cb = &args->callbacks->online_transfer;

  iec_var_t *st;
  gIec_vars = calloc(sizeof(iec_var_t), gVars_count);

  CALL_FUNC_INIT (__variables_init_PROGRAM0());
  CALL_FUNC_INIT (__variables_init_());

  uint32_t i = 0;
  for (i = 0; i < gVars_count; i++){
    st = getVariable(i);

    if (st->size_data == 0){
      err("Error: Incorrect size_data for %d:%s.", i, st->IEC_VAR_NAME);
      LogMessage(LOG_CRITICAL, "Error: Incorrect size_data for %d:%s.", i, st->IEC_VAR_NAME);
      memset(st, 0, sizeof(iec_var_t));
      return -1;
    }
    if (st->value_p == NULL){
      err("Error: Incorrect value_p for %d:%s.", i, st->IEC_VAR_NAME);
      LogMessage(LOG_CRITICAL, "Error: Incorrect value_p for %d:%s.", i, st->IEC_VAR_NAME);
      memset(st, 0, sizeof(iec_var_t));
      return -1;
    }
  }

  return 0;
}

void __variables_cleanup(void) {
  free(gIec_vars);
}


void __process_online_transfer(){
    // save variables and prepare to swap library
    online_transfer_save();
    stopPLC();
    cb->execute();
}

int OnlineTransferStartPLC(start_args_t *args)
{
    int ret = 0;

    if (!online_transfer_load())
        return -1;
    if ((ret =__retain_init(args)) != 0)
        return ret;
    if ((ret = startPLC(args)) != 0)
        return ret;
    __run();
    return ret;
}

#ifdef USE_RDC
extern IEC_BOOL g_rdc_failure;
#endif // USE_RDC

bool OnlineTransferSetType(transfer_type_t in) {
    dbg("Online transfer %srequested. Waiting for next loop to finish",
        in == ONLINE_NEW_VARIABLES ? "with variables initialization " : "");

    LogMessage(LOG_INFO, "Online transfer requested. Waiting for next loop to finish");

    online_transfer_prepare_save();

    g_transfer_type = in;

    return true;
}

void config_init__(void);
#ifdef USE_RDC
int __redundancy_init(start_args_t *args);
#endif // USE_RDC
bool OnlineTransferInitNewLibrary(start_args_t *args){
  g_transfer_type = args->transfer_type;
  g_callbacks = args->callbacks;

  config_init__();

 if (__variables_init(args) != 0)
    return false;
#ifdef USE_RDC
  if (__redundancy_init(args) != 0)
    return false;
#endif // USE_RDC
  return true;
}


extensions_exists_t *GetExtensionsExist(){
    return &metadata.extensions_exists;
}

bool GetVariablesPtr(iec_var_t **ptr, uint32_t *cnt){
    if (gIec_vars == NULL)
        return false;
    *ptr = gIec_vars;
    *cnt = gVars_count;
    return true;
}

// clang-format on
