CREATE OR REPLACE PACKAGE TRADE_PKG as
PROCEDURE ADD_TRADE 
    (
        P_TRADE_ID NUMBER,
        P_CUSTOMER_ID NUMBER,
        P_INSTRUMENT_ID NUMBER,
        P_AMOUNT NUMBER
    );
PROCEDURE APPROVE_TRADE
    (
        P_TRADE_ID NUMBER
    );

END TRADE_PKG;
/
CREATE OR REPLACE PACKAGE BODY TRADE_PKG AS
PROCEDURE ADD_TRADE 
    (
        P_TRADE_ID NUMBER,
        P_CUSTOMER_ID NUMBER,
        P_INSTRUMENT_ID NUMBER,
        P_AMOUNT NUMBER
    )
AS
BEGIN
IF P_AMOUNT<0 THEN
RAISE_APPLICATION_ERROR(-200002, 'Trade amount shoul be greater than 0');
END IF;
  INSERT INTO TRADES
        (
            TRADE_ID,
            CUSTOMER_ID,
            INSTRUMENT_ID,
            TRADE_AMOUNT,
            TRADE_DATE,
            STATUS
        )
        VALUES
        (
            P_TRADE_ID,
            P_CUSTOMER_ID,
            P_INSTRUMENT_ID,
            P_AMOUNT,
            SYSDATE,
            'PENDING'
        );
COMMIT;
END ADD_TRADE;
PROCEDURE APPROVE_TRADE
    (
        P_TRADE_ID NUMBER
    )
    AS
    BEGIN

        UPDATE TRADES
        SET STATUS='APPROVED'
        WHERE TRADE_ID=P_TRADE_ID;
COMMIT;

END APPROVE_TRADE;

END TRADE_PKG;
/


