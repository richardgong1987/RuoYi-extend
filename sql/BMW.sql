DROP TABLE IF EXISTS points_points;
CREATE TABLE points_points
(
    id                     BIGINT         NOT NULL
        PRIMARY KEY AUTO_INCREMENT COMMENT 'ID',
    user_name              VARCHAR(255)   NOT NULL UNIQUE COMMENT 'USER NAME',
    one_month_capital_flow DECIMAL(12, 2) NOT NULL COMMENT 'ONE MONTH CAPITAL FLOW',
    half_year_capital_flow DECIMAL(12, 2) NOT NULL COMMENT 'HALF YEAR CAPITAL FLOW',
    half_year_lottery      DECIMAL(12, 2) NOT NULL COMMENT 'HALF YEAR LOTTERY',
    month_lottery          DECIMAL(12, 2) NOT NULL COMMENT 'MONTH LOTTERY',
    one_year_lottery       DECIMAL(12, 2) NOT NULL COMMENT 'ONE YEAR LOTTERY',
    user_level             INTEGER        NOT NULL COMMENT 'USER LEVEL',
    one_year_capital_flow  DECIMAL(12, 2) NOT NULL COMMENT 'ONE YEAR CAPITAL FLOW'
) COMMENT '积分-用户管理';

DROP TABLE IF EXISTS points_add;
CREATE TABLE points_add
(
    id            BIGINT                 NOT NULL
        PRIMARY KEY AUTO_INCREMENT COMMENT 'ID',
    user_name     VARCHAR(255)           NOT NULL COMMENT 'USER NAME',
    change_points INTEGER                NOT NULL COMMENT 'CHANGE POINTS',
    tips          VARCHAR(255)           NOT NULL COMMENT 'TIPS',
    update_time   DATETIME DEFAULT NOW() NOT NULL COMMENT 'UPDATE TIME'
) COMMENT '积分-增加管理';


DROP TABLE IF EXISTS points_pointconfig;
CREATE TABLE points_pointconfig
(
    id                            BIGINT         NOT NULL
        PRIMARY KEY AUTO_INCREMENT COMMENT 'ID',
    water_to_point                INTEGER        NOT NULL COMMENT 'WATER_TO_POINT',
    discount_one_Percent          DECIMAL(12, 2) NOT NULL COMMENT 'DISCOUNT ONE PERCENT',
    discount_one_water            INTEGER        NOT NULL COMMENT 'DISCOUNT ONE WATER',
    discount_two_Percent          DECIMAL(12, 2) NOT NULL COMMENT 'DISCOUNT TWO PERCENT',
    discount_two_water            INTEGER        NOT NULL COMMENT 'DISCOUNT TWO WATER',
    discount_three_Percent        DECIMAL(12, 2) NOT NULL COMMENT 'DISCOUNT THREE PERCENT',
    discount_three_water          INTEGER        NOT NULL COMMENT 'DISCOUNT THREE WATER',
    discount_four_Percent         DECIMAL(12, 2) NOT NULL COMMENT 'DISCOUNT FOUR PERCENT',
    discount_four_water           INTEGER        NOT NULL COMMENT 'DISCOUNT FOUR WATER',
    discount_five_Percent         DECIMAL(12, 2) NOT NULL COMMENT 'DISCOUNT FIVE PERCENT',
    discount_five_water           INTEGER        NOT NULL COMMENT 'DISCOUNT FIVE WATER',
    config_name                   VARCHAR(255)   NOT NULL COMMENT 'CONFIG NAME',
    auto_flush                    VARCHAR(255)   NOT NULL COMMENT 'AUTO FLUSH',
    discount_five_slot_machine    INTEGER        NOT NULL COMMENT 'DISCOUNT FIVE_SLOT MACHINE',
    discount_four_slot_machine    INTEGER        NOT NULL COMMENT 'DISCOUNT FOUR_SLOT MACHINE',
    discount_one_slot_machine     INTEGER        NOT NULL COMMENT 'DISCOUNT ONE_SLOT MACHINE',
    discount_special_Percent      DECIMAL(12, 2) NOT NULL COMMENT 'DISCOUNT SPECIAL PERCENT',
    discount_special_slot_machine INTEGER        NOT NULL COMMENT 'DISCOUNT SPECIAL SLOT MACHINE',
    discount_special_water        INTEGER        NOT NULL COMMENT 'DISCOUNT SPECIAL WATER',
    discount_three_slot_machine   INTEGER        NOT NULL COMMENT 'DISCOUNT THREE_SLOT MACHINE',
    discount_two_slot_machine     INTEGER        NOT NULL COMMENT 'DISCOUNT TWO_SLOT MACHINE'
) COMMENT '积分-积分计算配置';



DROP TABLE IF EXISTS vip_list;
CREATE TABLE vip_list
(
    id                     BIGINT             NOT NULL
        PRIMARY KEY AUTO_INCREMENT COMMENT 'ID',
    user_id                VARCHAR(255)       NOT NULL COMMENT 'USER ID',
    user_name              VARCHAR(255)       NOT NULL COMMENT 'USER NAME',
    user_level             VARCHAR(255)       NOT NULL COMMENT 'USER LEVEL',
    shop_level             INTEGER            NOT NULL COMMENT 'SHOP LEVEL',
    level_up               INTEGER            NOT NULL COMMENT 'LEVEL UP',
    flag_level             BOOL               NOT NULL COMMENT 'FLAG LEVEL',
    flag_money             BOOL               NOT NULL COMMENT 'FLAG MONEY',
    change_time            DATETIME DEFAULT NOW() NOT NULL COMMENT 'CHANGE TIME',
    current_level_up_money INTEGER            NOT NULL COMMENT 'CURRENT LEVEL UP MONEY'
) COMMENT ' VIP管理-VIP客户管理';

DROP TABLE IF EXISTS vip_setting;
CREATE TABLE vip_setting
(
    id             BIGINT                 NOT NULL
        PRIMARY KEY AUTO_INCREMENT COMMENT 'ID',
    vip_valid      INTEGER                NOT NULL COMMENT 'VIP VALID',
    common_valid   INTEGER                NOT NULL COMMENT 'COMMON VALID',
    level_up_one   INTEGER                NOT NULL COMMENT 'LEVEL UP ONE',
    level_up_two   INTEGER                NOT NULL COMMENT 'LEVEL UP TWO',
    level_up_three INTEGER                NOT NULL COMMENT 'LEVEL UP THREE',
    level_up_four  INTEGER                NOT NULL COMMENT 'LEVEL UP FOUR',
    level_up_five  INTEGER                NOT NULL COMMENT 'LEVEL UP FIVE',
    level_up_six   INTEGER                NOT NULL COMMENT 'LEVEL UP SIX',
    create_time    DATETIME DEFAULT NOW() NOT NULL COMMENT 'CREATE TIME',
    update_time    DATETIME DEFAULT NOW() NOT NULL COMMENT 'UPDATE TIME'

) COMMENT ' VIP管理-VIP优惠设置';


DROP TABLE IF EXISTS data_dataindexpage;
CREATE TABLE data_dataindexpage
(
    id              BIGINT                 NOT NULL
        PRIMARY KEY AUTO_INCREMENT COMMENT 'ID',
    proxy           VARCHAR(255)           NOT NULL COMMENT 'PROXY',
    user            VARCHAR(255)           NOT NULL COMMENT 'USER',
    capital_flow    DECIMAL(12, 2)         NOT NULL COMMENT 'CAPITAL FLOW',
    capital_return  DECIMAL(12, 2)         NOT NULL COMMENT 'CAPITAL RETURN',
    sports          DECIMAL(12, 2)         NOT NULL COMMENT 'SPORTS',
    `table`         DECIMAL(12, 2)         NOT NULL COMMENT 'TABLE',
    slot_machine    DECIMAL(12, 2)         NOT NULL COMMENT 'SLOT_MACHINE',
    lottery         DECIMAL(12, 2)         NOT NULL COMMENT 'LOTTERY',
    fishing_machine DECIMAL(12, 2)         NOT NULL COMMENT 'FISHING_MACHINE',
    poker           DECIMAL(12, 2)         NOT NULL COMMENT 'POKER',
    create_time     DATETIME DEFAULT NOW() NOT NULL COMMENT 'CREATE TIME',
    update_time     DATETIME DEFAULT NOW() NOT NULL COMMENT 'UPDATE TIME'
) COMMENT '流水数据-源数据分析';

DROP TABLE IF EXISTS data_monthdatastatistic;
CREATE TABLE data_monthdatastatistic
(
    id              BIGINT         NOT NULL
        PRIMARY KEY AUTO_INCREMENT COMMENT 'ID',
    proxy           VARCHAR(255)   NOT NULL COMMENT 'PROXY',
    user            VARCHAR(255)   NOT NULL COMMENT 'USER',
    capital_flow    DECIMAL(12, 2) NOT NULL COMMENT 'CAPITAL FLOW',
    capital_return  DECIMAL(12, 2) NOT NULL COMMENT 'CAPITAL RETURN',
    sports          DECIMAL(12, 2) NOT NULL COMMENT 'SPORTS',
    `table`         DECIMAL(12, 2) NOT NULL COMMENT 'TABLE',
    slot_machine    DECIMAL(12, 2) NOT NULL COMMENT 'SLOT MACHINE',
    lottery         DECIMAL(12, 2) NOT NULL COMMENT 'LOTTERY',
    fishing_machine DECIMAL(12, 2) NOT NULL COMMENT 'FISHING MACHINE',
    poker           DECIMAL(12, 2) NOT NULL COMMENT 'POKER'
) COMMENT '流水数据-月数据分析';



DROP TABLE IF EXISTS data_halfyeardatastatistic;
CREATE TABLE data_halfyeardatastatistic
(
    id              BIGINT         NOT NULL
        PRIMARY KEY AUTO_INCREMENT COMMENT 'ID',
    proxy           VARCHAR(255)   NOT NULL COMMENT 'PROXY',
    user            VARCHAR(255)   NOT NULL COMMENT 'USER',
    capital_flow    DECIMAL(12, 2) NOT NULL COMMENT 'CAPITAL FLOW',
    capital_return  DECIMAL(12, 2) NOT NULL COMMENT 'CAPITAL RETURN',
    sports          DECIMAL        NOT NULL COMMENT 'SPORTS',
    `table`         DECIMAL(12, 2) NOT NULL COMMENT 'TABLE',
    slot_machine    DECIMAL(12, 2) NOT NULL COMMENT 'SLOT MACHINE',
    lottery         DECIMAL(12, 2) NOT NULL COMMENT 'LOTTERY',
    fishing_machine DECIMAL(12, 2) NOT NULL COMMENT 'FISHING MACHINE',
    poker           DECIMAL(12, 2) NOT NULL COMMENT 'POKER'
) COMMENT '流水数据-半年数据分析';


DROP TABLE IF EXISTS data_oneyeardatastatistic;
CREATE TABLE data_oneyeardatastatistic
(
    id              BIGINT         NOT NULL
        PRIMARY KEY AUTO_INCREMENT COMMENT 'ID',
    proxy           VARCHAR(255)   NOT NULL COMMENT 'PROXY',
    user            VARCHAR(255)   NOT NULL COMMENT 'USER',
    capital_flow    DECIMAL(12, 2) NOT NULL COMMENT 'CAPITAL FLOW',
    capital_return  DECIMAL(12, 2) NOT NULL COMMENT 'CAPITAL RETURN',
    sports          DECIMAL(12, 2) NOT NULL COMMENT 'SPORTS',
    `table`         DECIMAL(12, 2) NOT NULL COMMENT 'TABLE',
    slot_machine    DECIMAL(12, 2) NOT NULL COMMENT 'SLOT MACHINE',
    lottery         DECIMAL(12, 2) NOT NULL COMMENT 'LOTTERY',
    fishing_machine DECIMAL(12, 2) NOT NULL COMMENT 'FISHING MACHINE',
    poker           DECIMAL(12, 2) NOT NULL COMMENT 'POKER'
) COMMENT '流水数据-一年数据分析';



DROP TABLE IF EXISTS attachments_images;
CREATE TABLE attachments_images
(
    id          BIGINT                     NOT NULL
        PRIMARY KEY AUTO_INCREMENT COMMENT 'ID',
    url         VARCHAR(255) DEFAULT '' COMMENT '图片地址',
    create_time DATETIME     DEFAULT NOW() NOT NULL COMMENT 'CREATE TIME'

) COMMENT '运营管理-图片';

DROP TABLE IF EXISTS attachments_docs;
CREATE TABLE attachments_docs
(
    id          BIGINT                     NOT NULL
        PRIMARY KEY AUTO_INCREMENT COMMENT 'ID',
    url         VARCHAR(255) DEFAULT '' COMMENT '文件地址',
    create_time DATETIME     DEFAULT NOW() NOT NULL COMMENT 'CREATE TIME'

) COMMENT '运营管理-文档';


DROP TABLE IF EXISTS sign_sign;
CREATE TABLE sign_sign
(
    id          BIGINT                 NOT NULL
        PRIMARY KEY AUTO_INCREMENT COMMENT 'ID',
    user_name   VARCHAR(255)           NOT NULL COMMENT 'USER NAME',
    points      INTEGER                NOT NULL COMMENT 'POINTS',
    create_time DATETIME DEFAULT NOW() NOT NULL COMMENT 'CREATE TIME'
) COMMENT '运营管理-签到管理';

DROP TABLE IF EXISTS orders_orders;
CREATE TABLE orders_orders
(
    id          BIGINT                 NOT NULL
        PRIMARY KEY AUTO_INCREMENT COMMENT 'ID',
    take_name   VARCHAR(255)           NOT NULL COMMENT 'TAKE NAME',
    user_name   VARCHAR(255)           NOT NULL COMMENT 'USER NAME',
    goods       VARCHAR(255)           NOT NULL COMMENT 'GOODS',
    goods_id    INTEGER                NOT NULL COMMENT 'GOODS id',
    email       VARCHAR(254)           NOT NULL COMMENT 'EMAIL',
    phone       INTEGER                NOT NULL COMMENT 'PHONE',
    wechart     VARCHAR(255)           NOT NULL COMMENT 'WECHART',
    address     VARCHAR(255)           NOT NULL COMMENT 'ADDRESS',
    cost        INTEGER                NOT NULL COMMENT 'COST',
    status      VARCHAR(255)           NOT NULL COMMENT 'STATUS',
    image_id    INTEGER                NOT NULL COMMENT 'IMAGE_ID',
    discount    DECIMAL(12, 2)         NOT NULL COMMENT 'DISCOUNT',
    real_cost   INTEGER                NOT NULL COMMENT 'REAL COST',
    tips        VARCHAR(255)           NOT NULL COMMENT 'TIPS',
    create_time DATETIME DEFAULT NOW() NOT NULL COMMENT 'CREATE TIME',
    update_time DATETIME DEFAULT NOW() NOT NULL COMMENT 'UPDATE TIME'

) COMMENT '运营管理-订单管理';





