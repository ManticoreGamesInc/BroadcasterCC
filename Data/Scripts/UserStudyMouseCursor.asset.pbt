Assets {
  Id: 18052096426048538559
  Name: "UserStudyMouseCursor"
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
        Name: "cs:ScreenSizeScript"
        ObjectReference {
        }
      }
      Overrides {
        Name: "cs:SubjectCursor"
        ObjectReference {
        }
      }
      Overrides {
        Name: "cs:UserStudyAPI:tooltip"
        String: "Reference to the API script, that will be required."
      }
      Overrides {
        Name: "cs:ScreenSizeScript:tooltip"
        String: "Reference to the study component that handles the subject\'s screen resolution. The mouse cursor component needs that information in order to normalize the fake cursor\'s position when the subject and observer have different screen sizes."
      }
      Overrides {
        Name: "cs:SubjectCursor:tooltip"
        String: "Reference to the fake cursor UI element that will appear to the observer and represents the subject\'s actual mouse cursor."
      }
    }
  }
  SerializationVersion: 91
}
