pageextension 50131 "SOL Grade Customer List Ext" extends "Customer List"
{
    layout
    {
        addlast(Control1)
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
                SubPageLink = "Customer No." = field("No.");

            }
        }    
    }
}
