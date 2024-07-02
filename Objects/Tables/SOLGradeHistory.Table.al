table 50132 "SOL Grade History"
{
    Caption = 'Grade History';
    DataClassification = ToBeClassified;
    LookupPageId = "SOL Grade History List";
    DrillDownPageId = "SOL Grade History List";

    fields
    {
        field(1; "Entry No."; Integer)
        {
            Caption = 'Entry No.';
            AutoIncrement = true;
        }
        field(2; "Document Type"; Text[100])
        {
            Caption = 'Document Type';
        }
        field(3; "Document no."; Code[20])
        {
            Caption = 'Document no.';
        }
        field(4; "Document Date"; Date)
        {
            Caption = 'Document Date';
        }
        field(5; "Customer No."; Code[20])
        {
            Caption = 'Customer No.';
        }
        field(6; "Customer Name"; Text[100])
        {
            Caption = 'Customer Name';
        }
        field(7; "DateTime"; DateTime)
        {
            Caption = 'DateTime';
        }
        field(8; "UserID"; Code[50])
        {
            Caption = 'UserID';
        }
        field(9; Grade; Code[20])
        {
            Caption = 'Grade';
        }
        field(10; "Grade Description"; Text[100])
        {
            Caption = 'Grade Description';
        }
    }
    keys
    {
        key(PK; "Entry No.")
        {
            Clustered = true;
        }
    }

    procedure InsertIntoGradeHistory(DocumentType: Text[20]; DocumentNo: Code[20]; DocumentDate: Date; CustomerNo: Code[20]; GradeNo: Code[20])
    var
        Customer: Record Customer;
        GradeRecord: Record "SOL Grade";
    begin

        Init();
        Validate("Document Date", DocumentDate);
        Validate("Document no.", DocumentNo);
        Validate("Document Type", DocumentType);

        Customer.GET(CustomerNo);
        Validate("Customer No.", CustomerNo);
        Validate("Customer Name", Customer.Name + Customer."Name 2");

        GradeRecord.GET(GradeNo);
        Validate(Grade, GradeNo);
        Validate("Grade Description", GradeRecord.Description);

        Insert(true);

    end;

    trigger OnInsert()
    begin

        Validate(UserID, UserID);
        Validate(DateTime, CurrentDateTime);
    end;
}
