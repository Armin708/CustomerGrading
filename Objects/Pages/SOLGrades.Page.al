page 50130 "SOL Grades"
{
    ApplicationArea = All;
    Caption = 'Grades';
    PageType = Card;
    SourceTable = "SOL Grade";
    UsageCategory = Documents;
    Editable = true;

    layout
    {
        area(Content)
        {
            group(General)
            {
                Caption = 'General';

                field("No."; Rec."No.")
                {
                    ToolTip = 'Specifies the value of the No. field.', Comment = '%';
                    Caption = 'No.';

                }
                field(Description; Rec.Description)
                {
                    ToolTip = 'Specifies the value of the Description field.', Comment = '%';
                    Caption = 'Description';
                }

                field("No. Series"; Rec."No. Series")
                {
                    ToolTip = 'Grade No Series';
                    Caption = 'No. Series';
                }
            }

        }
        area(FactBoxes)
        {
            systempart(RecordLinks; Links)
            {
                ApplicationArea = All;
            }
            systempart(Notes; Notes)
            {
                ApplicationArea = All;
            }
        }
    }
}
