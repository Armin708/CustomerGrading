page 50133 "SOL Grade History List"
{
    ApplicationArea = All;
    Caption = 'SOL Grade History List';
    PageType = List;
    SourceTable = "SOL Grade History";
    UsageCategory = Lists;
    Editable = false;
    DataCaptionFields = Grade;

    layout
    {
        area(Content)
        {
            repeater(General)
            {
                field("Entry No."; Rec."Entry No.")
                {
                    ToolTip = 'Specifies the value of the Entry No. field.', Comment = '%';
                }
                field(Grade; Rec.Grade)
                {
                    ToolTip = 'Specifies the value of the Grade field.', Comment = '%';
                }
                field("Grade Description"; Rec."Grade Description")
                {
                    ToolTip = 'Specifies the value of the Grade Description field.', Comment = '%';
                }
                field("Customer No."; Rec."Customer No.")
                {
                    ToolTip = 'Specifies the value of the Customer No. field.', Comment = '%';
                }
                field("Customer Name"; Rec."Customer Name")
                {
                    ToolTip = 'Specifies the value of the Customer Name field.', Comment = '%';
                }
                field("Document Type"; Rec."Document Type")
                {
                    ToolTip = 'Specifies the value of the Document Type field.', Comment = '%';
                }
                field("Document no."; Rec."Document no.")
                {
                    ToolTip = 'Specifies the value of the Document no. field.', Comment = '%';
                }
                field("Document Date"; Rec."Document Date")
                {
                    ToolTip = 'Specifies the value of the Document Date field.', Comment = '%';
                }
                field("DateTime"; Rec."DateTime")
                {
                    ToolTip = 'Specifies the value of the DateTime field.', Comment = '%';
                }
            }
        }
    }
}
