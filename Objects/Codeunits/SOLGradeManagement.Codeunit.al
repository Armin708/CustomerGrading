codeunit 50130 "SOL Grade Management"
{
    Permissions = TableData "Sales Invoice Header" = rm, TableData "Sales Cr.Memo Header" = rm, TableData "Cust. Ledger Entry" = rm;

    var
        SOLGradeGistory: Record "SOL Grade History";

    // When a Grade is modified or assigned to a Customer
    [EventSubscriber(ObjectType::Table, Database::Customer, 'OnAfterValidateSOLGrade', '', false, false)]
    local procedure AssignGradeToCustomer(var Customer: Record Customer; xCustomer: Record Customer)
    begin
        SOLGradeGistory.InsertIntoGradeHistory('Customer', '', 0D, Customer."No.", Customer."SOL Grade");
    end;

    // When a Customer is assigned to a Sales Order
    [EventSubscriber(ObjectType::Table, Database::"Sales Header", 'OnAfterOnInsert', '', false, false)]
    local procedure AssignGradeToSalesHeader(var SalesHeader: Record "Sales Header")
    var
        Customer: Record Customer;
    begin
        if SalesHeader."Document Type" <> SalesHeader."Document Type"::Order then
            exit;

        clear(Customer);
        if not Customer.GET(SalesHeader."Bill-To Customer No.") then
            exit;

        if Customer."SOL Grade" = '' then
            exit;

        SalesHeader.Validate("SOL Grade", Customer."SOL Grade");

        SOLGradeGistory.InsertIntoGradeHistory('SalesOrder', SalesHeader."No.", SalesHeader."Document Date", Customer."No.", Customer."SOL Grade");

    end;

    // When Customer Ledger Entries are created
    [EventSubscriber(ObjectType::Table, Database::"Cust. Ledger Entry", 'OnAfterInsertEvent', '', false, false)]
    local procedure AssignGradeToCustomerLedger(var Rec: Record "Cust. Ledger Entry"; RunTrigger: Boolean)
    var
        Customer: Record Customer;
    begin

        if Rec."Document No." = '' then
            exit;

        clear(Customer);
        if not Customer.GET(Rec."Customer No.") then
            exit;

        if Customer."SOL Grade" = '' then
            exit;

        Rec.Validate("SOL Grade", Customer."SOL Grade");
        if Rec.Modify(true) then
            SOLGradeGistory.InsertIntoGradeHistory('CustLedgerEntry', format(Rec."Entry No."), Rec."Posting Date", Customer."No.", Customer."SOL Grade");


    end;

    // When a Sales Order is posted to a Sales Invoice or When a Credit Note is created
    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Sales-Post", 'OnAfterPostSalesDoc', '', false, false)]
    local procedure AssignGradeDuringSalesPost(var SalesHeader: Record "Sales Header"; var GenJnlPostLine: Codeunit "Gen. Jnl.-Post Line"; SalesShptHdrNo: Code[20];
                                                RetRcpHdrNo: Code[20]; SalesInvHdrNo: Code[20]; SalesCrMemoHdrNo: Code[20]; CommitIsSuppressed: Boolean;
                                                InvtPickPutaway: Boolean; var CustLedgerEntry: Record "Cust. Ledger Entry"; WhseShip: Boolean; WhseReceiv: Boolean;
                                                PreviewMode: Boolean)
    var
        Customer: Record Customer;
        SalesInvoiceHeader: Record "Sales Invoice Header";
        SalesCrMemoHeader: Record "Sales Cr.Memo Header";
    begin

        if SalesHeader."Bill-to Customer No." = '' then
            exit;

        clear(Customer);
        if not Customer.GET(SalesHeader."Bill-to Customer No.") then
            exit;

        if Customer."SOL Grade" = '' then
            exit;

        if SalesInvHdrNo <> '' then begin

            clear(SalesInvoiceHeader);
            SalesInvoiceHeader.get(SalesInvHdrNo);
            SalesInvoiceHeader.Validate("SOL Grade", Customer."SOL Grade");
            SalesInvoiceHeader.Modify(true);
            SOLGradeGistory.InsertIntoGradeHistory('SalesInvoice', SalesInvoiceHeader."No.", SalesInvoiceHeader."Posting Date", Customer."No.", Customer."SOL Grade");

        end;

        if SalesCrMemoHdrNo <> '' then begin

            clear(SalesCrMemoHeader);
            SalesCrMemoHeader.get(SalesCrMemoHdrNo);
            SalesCrMemoHeader.Validate("SOL Grade", Customer."SOL Grade");
            SalesCrMemoHeader.Modify(true);
            SOLGradeGistory.InsertIntoGradeHistory('SalesCrMemo', SalesCrMemoHeader."No.", SalesCrMemoHeader."Posting Date", Customer."No.", Customer."SOL Grade");

        end;

    end;
}
