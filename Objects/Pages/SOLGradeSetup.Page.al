page 50132 "SOL Grade Setup"
{
    ApplicationArea = All;
    Caption = 'Grade Setup';
    PageType = Card;
    SourceTable = "SOL Grade Setup";
    UsageCategory = Administration;

    layout
    {
        area(Content)
        {
            group(General)
            {
                Caption = 'General';

                field("Grade Nos."; Rec."Grade Nos.")
                {
                    ToolTip = 'Specifies the value of the Grade Nos. field.', Comment = '%';
                }
            }
        }
    }

    trigger OnOpenPage()
    begin
        if Rec.IsEmpty then begin

            Rec.Init();
            Rec.Insert();

        end;
    end;
}
