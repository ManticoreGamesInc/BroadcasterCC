Assets {
  Id: 15479419207500979944
  Name: "UserStudyServer"
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
        Name: "cs:NetworkedObject"
        ObjectReference {
        }
      }
      Overrides {
        Name: "cs:UserStudyAPI:tooltip"
        String: "Reference to the API script, that will be required."
      }
      Overrides {
        Name: "cs:NetworkedObject:tooltip"
        String: "Reference to the networked object that will be used by the API to send data through custom properties."
      }
    }
  }
  SerializationVersion: 91
}
