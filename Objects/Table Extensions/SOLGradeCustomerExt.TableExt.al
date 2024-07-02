tableextension 50130 "SOL Grade Customer Ext" extends Customer
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
                OnAfterValidateSOLGrade(Rec, xRec);
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


    [IntegrationEvent(false, false)]
    local procedure OnAfterValidateSOLGrade(var Customer: Record Customer; xCustomer: Record Customer)
    begin
    end;

}
