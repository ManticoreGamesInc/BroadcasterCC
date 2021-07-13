Assets {
  Id: 17262374815295182989
  Name: "UserStudyButtonClick"
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
        Name: "cs:ClickSFX"
        ObjectReference {
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
        Name: "cs:FeedbackTextDuration"
        Float: 2
      }
      Overrides {
        Name: "cs:UserStudyAPI:tooltip"
        String: "Reference to the API script, that will be required."
      }
      Overrides {
        Name: "cs:ClickSFX:tooltip"
        String: "Reference to the sound object that will be played to the observer each time the subject clicks on a button."
      }
      Overrides {
        Name: "cs:UIContainer:tooltip"
        String: "Reference to the UI Container seen by the observer, where the fake cursor exists and feedback texts will be spawned into."
      }
      Overrides {
        Name: "cs:SubjectCursor:tooltip"
        String: "Reference to the fake cursor UI element that will appear to the observer and represents the subject\'s actual mouse cursor."
      }
      Overrides {
        Name: "cs:FeedbackTextTemplate:tooltip"
        String: "Template for the feedback text that will be spawned and seen by the observer."
      }
      Overrides {
        Name: "cs:FeedbackTextDuration:tooltip"
        String: "Duration of the feedback text that is spawned in some cases when the subject clicks a button."
      }
    }
  }
  SerializationVersion: 91
}
