Assets {
  Id: 6068497002644426492
  Name: "UserStudyScrollPanel"
  PlatformAssetType: 3
  TextAsset {
    CustomParameters {
      Overrides {
        Name: "cs:UserStudyAPI"
        AssetReference {
          Id: 4351186339395260028
        }
      }
      Overrides {
        Name: "cs:UIContainer"
        ObjectReference {
        }
      }
      Overrides {
        Name: "cs:SubjectCursor"
        ObjectReference {
        }
      }
      Overrides {
        Name: "cs:FeedbackTextTemplate"
        AssetReference {
          Id: 14599555197935353646
        }
      }
      Overrides {
        Name: "cs:UserStudyAPI:tooltip"
        String: "Reference to the API script, that will be required."
      }
      Overrides {
        Name: "cs:UIContainer:tooltip"
        String: "Reference to the UI Container seen by the observer, where the fake cursor exists and feedback texts will be spawned into."
      }
      Overrides {
        Name: "cs:FeedbackTextTemplate:tooltip"
        String: "Template for the feedback text that will be spawned and seen by the observer."
      }
      Overrides {
        Name: "cs:SubjectCursor:tooltip"
        String: "Reference to the fake cursor UI element that will appear to the observer and represents the subject\'s actual mouse cursor."
      }
    }
  }
  SerializationVersion: 92
}
