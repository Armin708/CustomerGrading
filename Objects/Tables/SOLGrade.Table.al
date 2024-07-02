table 50130 "SOL Grade"
{
    Caption = 'Grades';
    DataClassification = ToBeClassified;
    LookupPageId = 50131;
    DrillDownPageId = 50131;
    fields
    {
        field(1; "No."; Code[20])
        {
            Caption = 'No.';

            trigger OnValidate()
            var
                GradeSetup: Record "SOL Grade Setup";
                NoSeriesMgmt: Codeunit "No. Series";
            begin
                GradeSetup.Get();
                if "No." <> xRec."No." then begin

                    NoSeriesMgmt.TestManual("No. Series");
                    "No. Series" := '';                    

                end;
            end;
        }
        field(2; Description; Text[100])
        {
            Caption = 'Description';
        }
        field(3; "No. Series"; Code[20])
        {
            Editable = False;
            TableRelation = "No. Series".Code;
            Caption = 'No. Series';
        }
    }
    keys
    {
        key(PK; "No.")
        {
            Clustered = true;
        }
    }
    fieldgroups
    {
        // Add changes to field groups here
    }

    trigger OnInsert()
    var
        GradeSetup: Record "SOL Grade Setup";
        NoSeriesMgmt: Codeunit "No. Series";
    begin
        if "No." = '' then begin

            GradeSetup.Get();
            GradeSetup.TestField("Grade Nos.");
            "No." := NoSeriesMgmt.GetNextNo(GradeSetup."Grade Nos.");

        end;

    end;

    trigger OnModify()
    begin

    end;

    trigger OnDelete()
    begin

    end;

    trigger OnRename()
    begin

    end;

    procedure AssistEdit(): Boolean
    var
        Grade: Record "SOL Grade";
        GradeSetup: Record "SOL Grade Setup";
        NoSeriesMgmt: Codeunit "NoSeriesManagement";


    begin

        Grade := Rec;
        GradeSetup.Get();
        GradeSetup.TestField("Grade Nos.");
        if NoSeriesMgmt.SelectSeries(GradeSetup."Grade Nos.", xRec."No. Series", Grade."No. Series") then begin
            NoSeriesMgmt.SetSeries(Grade."No.");
            Rec := Grade;
            exit(true);
        end;

    end;

}
