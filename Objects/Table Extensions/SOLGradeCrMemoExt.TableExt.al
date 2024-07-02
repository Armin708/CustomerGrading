tableextension 50134 "SOL Grade CrMemoExt" extends "Sales Cr.Memo Header"
{
    fields
    {
        field(50130; "SOL Grade"; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "SOL Grade"."No.";
            NotBlank = true;
            Caption = 'SOL Grade';
            trigger OnValidate()               
            begin
                CalcFields("SOL Grade Description");
            end;
        }

        field(50131; "SOL Grade Description"; Text[100])
        {
            FieldClass = FlowField;
            Caption = 'SOL Grade';
            Editable = false;
            CalcFormula = lookup("SOL Grade".Description where("No." = field("SOL Grade")));
        }
    }
}
