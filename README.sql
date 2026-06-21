# Oracle PL/SQL Trade Processing System

## Project Overview

This project demonstrates the implementation of a Trade Processing System using Oracle SQL and PL/SQL. The system manages trade creation, approval workflows, audit logging, and reporting using database objects such as tables, procedures, triggers, views, packages, sequences, and functions.

---

## Features

- Customer Management
- Instrument Management
- Trade Creation
- Trade Approval Workflow
- Audit Logging
- Business Validation
- Trade Reporting
- PL/SQL Package Implementation
- Function-Based Reporting

---

## Database Objects

### Tables

#### CUSTOMERS
Stores customer information.

| Column | Description |
|----------|-------------|
| CUSTOMER_ID | Primary Key |
| CUSTOMER_NAME | Customer Name |
| COUNTRY | Customer Country |
| CREATED_DATE | Record Creation Date |

#### INSTRUMENTS
Stores financial instrument details.

| Column | Description |
|----------|-------------|
| INSTRUMENT_ID | Primary Key |
| INSTRUMENT_NAME | Instrument Name |
| CURRENCY | Instrument Currency |

#### TRADES
Stores trade transactions.

| Column | Description |
|----------|-------------|
| TRADE_ID | Primary Key |
| CUSTOMER_ID | Foreign Key |
| INSTRUMENT_ID | Foreign Key |
| TRADE_AMOUNT | Trade Amount |
| TRADE_DATE | Trade Date |
| STATUS | Trade Status |

#### TRADE_AUDIT
Stores trade audit records.

| Column | Description |
|----------|-------------|
| AUDIT_ID | Primary Key |
| TRADE_ID | Trade Identifier |
| ACTION_TYPE | Audit Action |
| ACTION_DATE | Audit Timestamp |

---

## Sequence

### AUDIT_SEQ

Used to generate unique audit IDs automatically.

```sql
AUDIT_SEQ.NEXTVAL
```

---

## Procedures

### ADD_TRADE

Creates a new trade with PENDING status.

#### Parameters

| Parameter | Description |
|------------|-------------|
| P_TRADE_ID | Trade ID |
| P_CUSTOMER_ID | Customer ID |
| P_INSTRUMENT_ID | Instrument ID |
| P_AMOUNT | Trade Amount |

---

### APPROVE_TRADE

Approves an existing trade.

#### Parameters

| Parameter | Description |
|------------|-------------|
| P_TRADE_ID | Trade ID |

---

## Triggers

### TRG_TRIGGER_AUDIT

Automatically inserts an audit record whenever a new trade is created.

Action Recorded:

```text
TRADE CREATED
```

---

### TRG_TRADE_APPROVAL_AUDIT

Automatically inserts an audit record whenever a trade status changes to APPROVED.

Action Recorded:

```text
TRADE_APPROVED
```

---

## View

### VW_TRADE_DETAILS

Provides a consolidated view of trades, customers, and instruments.

Includes:

- Trade ID
- Customer Name
- Instrument Name
- Trade Amount
- Trade Status
- Trade Date

---

## Function

### GET_TRADE_COUNT

Returns the total number of trades in the system.

Example:

```sql
SELECT GET_TRADE_COUNT
FROM DUAL;
```

---

## Package

### TRADE_PKG

Contains:

- ADD_TRADE Procedure
- APPROVE_TRADE Procedure

Example:

```sql
EXEC TRADE_PKG.ADD_TRADE(9001,1,101,10000);

EXEC TRADE_PKG.APPROVE_TRADE(9001);
```

---

## Sample Execution

### Create Trade

```sql
EXEC TRADE_PKG.ADD_TRADE(9001,1,101,15000);
```

### Approve Trade

```sql
EXEC TRADE_PKG.APPROVE_TRADE(9001);
```

### Verify Audit

```sql
SELECT *
FROM TRADE_AUDIT
WHERE TRADE_ID = 9001;
```

---

## Technologies Used

- Oracle Database
- Oracle SQL
- PL/SQL
- SQL Developer

---

## Concepts Demonstrated

- DDL Statements
- DML Statements
- Primary Keys
- Foreign Keys
- Sequences
- Stored Procedures
- Packages
- Triggers
- Views
- Functions
- Exception Handling
- Transaction Management
- Audit Logging

---

## Author

Soundarya

Oracle SQL & PL/SQL Learning Project