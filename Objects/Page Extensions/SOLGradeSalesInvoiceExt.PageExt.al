pageextension 50135 "SOL Grade Sales Invoice Ext" extends "Sales Invoice"
{
    layout
    {
        addlast(General)
        {
            field("SOL Grade"; Rec."SOL Grade")
            {
                ToolTip = 'tool Tip';
                ApplicationArea = All;
            }

            field("SOL Grade Description"; Rec."SOL Grade Description")
            {
                ToolTip = 'tool Tip';
                ApplicationArea = All;
            }
        }

        addlast(factboxes)
        {
            part(GradeHistory; "SOL Grade History Factbox")
            {
                ApplicationArea = All;
                SubPageLink = "Customer No." = field("Bill-to Customer No.");
            }
        }    
    }


}
