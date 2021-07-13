Assets {
  Id: 251636084595810241
  Name: "Broadcaster"
  PlatformAssetType: 5
  TemplateAsset {
    ObjectBlock {
      RootId: 4853205747693520683
      Objects {
        Id: 4853205747693520683
        Name: "TemplateBundleDummy"
        Transform {
          Location {
          }
          Rotation {
          }
          Scale {
            X: 1
            Y: 1
            Z: 1
          }
        }
        Folder {
          BundleDummy {
            ReferencedAssets {
              Id: 1985159602667540743
            }
            ReferencedAssets {
              Id: 15895735235767099574
            }
            ReferencedAssets {
              Id: 17294201210613621409
            }
          }
        }
      }
    }
    Assets {
      Id: 17294201210613621409
      Name: "DisableIfObserver"
      PlatformAssetType: 5
      TemplateAsset {
        ObjectBlock {
          RootId: 8681813033837218601
          Objects {
            Id: 8681813033837218601
            Name: "DisableIfObserver"
            Transform {
              Scale {
                X: 1
                Y: 1
                Z: 1
              }
            }
            ParentId: 4781671109827199097
            Collidable_v2 {
              Value: "mc:ecollisionsetting:inheritfromparent"
            }
            Visible_v2 {
              Value: "mc:evisibilitysetting:inheritfromparent"
            }
            CameraCollidable {
              Value: "mc:ecollisionsetting:inheritfromparent"
            }
            EditorIndicatorVisibility {
              Value: "mc:eindicatorvisibility:visiblewhenselected"
            }
            Script {
              ScriptAsset {
                Id: 10533192025264867923
              }
            }
          }
        }
        PrimaryAssetId {
          AssetType: "None"
          AssetId: "None"
        }
      }
    }
    Assets {
      Id: 10533192025264867923
      Name: "DisableIfObserver"
      PlatformAssetType: 3
      TextAsset {
        Text: "--[[\r\n\tDisable if Observer\r\n\tv1.0\r\n\tby: standardcombo\r\n\t\r\n\tDisables the visibility of its parent, if the local player is an\r\n\tobserver. Works in conjuction with the Broadcaster / User Study CCs.\r\n--]]\r\n\r\nlocal ROOT = script.parent\r\n\r\nfunction Tick()\r\n\tTask.Wait(2)\r\n\t\r\n\tif _G.UserStudy and _G.UserStudy.IsObserver(Game.GetLocalPlayer()) then\r\n\t\tROOT.visibility = Visibility.FORCE_OFF\r\n\telse\r\n\t\tROOT.visibility = Visibility.INHERIT\r\n\tend\r\nend"
      }
    }
    Assets {
      Id: 15895735235767099574
      Name: "Broadcaster"
      PlatformAssetType: 5
      TemplateAsset {
        ObjectBlock {
          RootId: 854925687571159956
          Objects {
            Id: 854925687571159956
            Name: "Broadcaster"
            Transform {
              Scale {
                X: 1
                Y: 1
                Z: 1
              }
            }
            ParentId: 4781671109827199097
            ChildIds: 4211054246189978258
            ChildIds: 5268887015433097823
            ChildIds: 1040053908023139323
            ChildIds: 4066993593545738074
            Collidable_v2 {
              Value: "mc:ecollisionsetting:inheritfromparent"
            }
            Visible_v2 {
              Value: "mc:evisibilitysetting:inheritfromparent"
            }
            CameraCollidable {
              Value: "mc:ecollisionsetting:inheritfromparent"
            }
            EditorIndicatorVisibility {
              Value: "mc:eindicatorvisibility:visiblewhenselected"
            }
            Folder {
              IsFilePartition: true
              FilePartitionName: "Broadcaster"
            }
          }
          Objects {
            Id: 4211054246189978258
            Name: "Broadcaster_README"
            Transform {
              Location {
              }
              Rotation {
              }
              Scale {
                X: 1
                Y: 1
                Z: 1
              }
            }
            ParentId: 854925687571159956
            Collidable_v2 {
              Value: "mc:ecollisionsetting:inheritfromparent"
            }
            Visible_v2 {
              Value: "mc:evisibilitysetting:inheritfromparent"
            }
            CameraCollidable {
              Value: "mc:ecollisionsetting:inheritfromparent"
            }
            EditorIndicatorVisibility {
              Value: "mc:eindicatorvisibility:visiblewhenselected"
            }
            Script {
              ScriptAsset {
                Id: 8134322410980958869
              }
            }
          }
          Objects {
            Id: 5268887015433097823
            Name: "BroadcasterChatCommands"
            Transform {
              Location {
              }
              Rotation {
              }
              Scale {
                X: 1
                Y: 1
                Z: 1
              }
            }
            ParentId: 854925687571159956
            UnregisteredParameters {
              Overrides {
                Name: "cs:Admins"
                String: "Bot1,standardcombo, GetchLives,CoreVideo,Scav,Rolok"
              }
            }
            Collidable_v2 {
              Value: "mc:ecollisionsetting:inheritfromparent"
            }
            Visible_v2 {
              Value: "mc:evisibilitysetting:inheritfromparent"
            }
            CameraCollidable {
              Value: "mc:ecollisionsetting:inheritfromparent"
            }
            EditorIndicatorVisibility {
              Value: "mc:eindicatorvisibility:visiblewhenselected"
            }
            Script {
              ScriptAsset {
                Id: 4572443722256424580
              }
            }
          }
          Objects {
            Id: 1040053908023139323
            Name: "UserStudyServer"
            Transform {
              Location {
              }
              Rotation {
              }
              Scale {
                X: 1
                Y: 1
                Z: 1
              }
            }
            ParentId: 854925687571159956
            UnregisteredParameters {
              Overrides {
                Name: "cs:NetworkedObject"
                ObjectReference {
                  SubObjectId: 4066993593545738074
                }
              }
            }
            Collidable_v2 {
              Value: "mc:ecollisionsetting:inheritfromparent"
            }
            Visible_v2 {
              Value: "mc:evisibilitysetting:inheritfromparent"
            }
            CameraCollidable {
              Value: "mc:ecollisionsetting:inheritfromparent"
            }
            EditorIndicatorVisibility {
              Value: "mc:eindicatorvisibility:visiblewhenselected"
            }
            Script {
              ScriptAsset {
                Id: 15479419207500979944
              }
            }
          }
          Objects {
            Id: 4066993593545738074
            Name: "ClientContext"
            Transform {
              Location {
              }
              Rotation {
              }
              Scale {
                X: 1
                Y: 1
                Z: 1
              }
            }
            ParentId: 854925687571159956
            ChildIds: 1210003098773427160
            ChildIds: 2317382369173195992
            UnregisteredParameters {
              Overrides {
                Name: "cs:ObserverCount"
                Int: 0
              }
              Overrides {
                Name: "cs:Subjects"
                String: ""
              }
              Overrides {
                Name: "cs:ObserverCount:isrep"
                Bool: true
              }
              Overrides {
                Name: "cs:Subjects:isrep"
                Bool: true
              }
            }
            WantsNetworking: true
            Collidable_v2 {
              Value: "mc:ecollisionsetting:forceoff"
            }
            Visible_v2 {
              Value: "mc:evisibilitysetting:inheritfromparent"
            }
            CameraCollidable {
              Value: "mc:ecollisionsetting:inheritfromparent"
            }
            EditorIndicatorVisibility {
              Value: "mc:eindicatorvisibility:visiblewhenselected"
            }
            NetworkContext {
            }
          }
          Objects {
            Id: 1210003098773427160
            Name: "UserStudyClient"
            Transform {
              Location {
                Z: 200
              }
              Rotation {
              }
              Scale {
                X: 1
                Y: 1
                Z: 1
              }
            }
            ParentId: 4066993593545738074
            UnregisteredParameters {
              Overrides {
                Name: "cs:NetworkedObject"
                ObjectReference {
                  SubObjectId: 4066993593545738074
                }
              }
            }
            Collidable_v2 {
              Value: "mc:ecollisionsetting:inheritfromparent"
            }
            Visible_v2 {
              Value: "mc:evisibilitysetting:inheritfromparent"
            }
            CameraCollidable {
              Value: "mc:ecollisionsetting:inheritfromparent"
            }
            EditorIndicatorVisibility {
              Value: "mc:eindicatorvisibility:visiblewhenselected"
            }
            Script {
              ScriptAsset {
                Id: 16270552889358903912
              }
            }
          }
          Objects {
            Id: 2317382369173195992
            Name: "UI Container"
            Transform {
              Location {
              }
              Rotation {
              }
              Scale {
                X: 1
                Y: 1
                Z: 1
              }
            }
            ParentId: 4066993593545738074
            Collidable_v2 {
              Value: "mc:ecollisionsetting:inheritfromparent"
            }
            Visible_v2 {
              Value: "mc:evisibilitysetting:inheritfromparent"
            }
            CameraCollidable {
              Value: "mc:ecollisionsetting:inheritfromparent"
            }
            EditorIndicatorVisibility {
              Value: "mc:eindicatorvisibility:visiblewhenselected"
            }
            Control {
              RenderTransformPivot {
                Anchor {
                  Value: "mc:euianchor:middlecenter"
                }
              }
              Canvas {
                ContentType {
                  Value: "mc:ecanvascontenttype:dynamic"
                }
                Opacity: 1
              }
              AnchorLayout {
                SelfAnchor {
                  Anchor {
                    Value: "mc:euianchor:topleft"
                  }
                }
                TargetAnchor {
                  Anchor {
                    Value: "mc:euianchor:topleft"
                  }
                }
              }
            }
          }
        }
        PrimaryAssetId {
          AssetType: "None"
          AssetId: "None"
        }
      }
    }
    Assets {
      Id: 16270552889358903912
      Name: "UserStudyClient"
      PlatformAssetType: 3
      TextAsset {
        Text: "--[[\r\n\tUser Study - Client\r\n\tv1.1\r\n\tby: standardcombo\r\n\t\r\n\tHandles setup on the client-side.\r\n--]]\r\n\r\nlocal API = require( script:GetCustomProperty(\"UserStudyAPI\") )\r\nlocal NETWORKED_OBJECT = script:GetCustomProperty(\"NetworkedObject\"):WaitForObject()\r\n\r\n_G.UserStudy = API\r\n\r\nAPI.RegisterNetworkedObject(NETWORKED_OBJECT)\r\n"
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
    }
    Assets {
      Id: 4351186339395260028
      Name: "UserStudyAPI"
      PlatformAssetType: 3
      TextAsset {
        Text: "--[[\r\n\tUser Study - API\r\n\tv1.2\r\n\tby: standardcombo\r\n\t\r\n\tProvides a set of functions to control and to get information about\r\n\tthe study. The API script itself is state-less. Study state is stored\r\n\tin the observer\'s `serverUserData`.\r\n\t\r\n\tSee the README file to learn more about this package.\r\n\t\r\n\t\r\n\tServer-only functions:\r\n\t- BeginStudy(Player observer, string[] arguments)\r\n\t- EndStudy(Player observer)\r\n\t- NextSubject(Player observer)\r\n\t- PreviousSubject(Player observer)\r\n\t- ListAllOptions(Player observer)\r\n\t- ToggleResolution(Player observer, Boolean)\r\n\t- ToggleViewIndicator(Player observer, Boolean)\r\n\t- GetOption(Player player, string optionName)\r\n\t- ResetAllOptionsToDefault(Player observer)\r\n\t\r\n\tClient-only functions:\r\n\t- BroadcastToObservers(string eventName, ...)\r\n\t\r\n\tServer & Client functions:\r\n\t- RegisterNetworkedObject(CoreObject)\r\n\t- IsObserver(Player) - returns Boolean\r\n\t- IsSubject(Player) - returns Boolean\r\n\t- GetSubjectNames() - returns string\r\n\t- RemoveObservers(Player[])\r\n\t- FindPlayerWithName(string playerName)\r\n\t\r\n--]]\r\n\r\nlocal API = {}\r\n\r\nlocal ATTACHMENT_TEMPLATE = script:GetCustomProperty(\"AttachmentTemplate\")\r\nlocal SPECTATOR_CAMERA = script:GetCustomProperty(\"SpectatorCamera\")\r\n\r\nlocal EVENT_STUDY_STARTED = \"Study_Start\"\r\nlocal EVENT_STUDY_ENDED = \"Study_End\"\r\nlocal EVENT_SUBJECT_CHANGED = \"Study_NewSubject\"\r\nlocal EVENT_LOCAL_PLAYER_IS_SUBJECT = \"Study_LocalIsSubject\"\r\nlocal EVENT_REDIRECT_BROADCAST = \"Study_Redirect\"\r\nlocal EVENT_OPTION_CHANGED = \"Study_OptionChanged\"\r\n\r\nlocal BINDING_NEXT_SUBJECT = \"ability_primary\"\r\nlocal BINDING_PREV_SUBJECT = \"ability_secondary\"\r\nlocal CAMERA_ATTACHMENT_SOCKET = \"nameplate\"\r\n\r\nAPI.networkedObject = nil\r\nAPI.activeObservers = {}\r\nAPI.activeSubjects = {}\r\n\r\n-- Server & Client\r\nfunction API.RegisterNetworkedObject(obj)\r\n\tAPI.networkedObject = obj\r\n\t\r\n\tif Environment.IsClient() then\r\n\t\tobj.networkedPropertyChangedEvent:Connect(OnNetworkedPropertyChanged)\r\n\t\tTask.Wait()\r\n\t\tOnNetworkedPropertyChanged(obj, \"Subjects\")\r\n\tend\r\nend\r\n\r\n-- Server\r\nfunction API.BeginStudy(observer, arguments)\r\n\t--observer.team = 0\r\n\r\n\t-- Prepare arguments\r\n\tlocal playerName = nil\r\n\tif #arguments > 0 then\r\n\t\tplayerName = arguments[1]\r\n\tend\r\n\t\r\n\t-- Early exit case\r\n\tif playerName and string.lower(playerName) == string.lower(observer.name) then\r\n\t\t--Chat.BroadcastMessage(\"Cannot study self.\", {players = observer})\r\n\t\treturn\r\n\tend\r\n\t\r\n\tlocal data = GetStudyData(observer)\r\n\t\r\n\t-- Case where this observer is already studying\r\n\tif API.IsObserver(observer) then\r\n\t\t-- Additional command arguments\r\n\t\tif playerName then\r\n\t\t\tlocal subject = API.FindPlayerWithName(playerName)\r\n\t\t\tif subject then\r\n\t\t\t\tif subject ~= data.subject then\r\n\t\t\t\t\tSetSubject(observer, subject)\r\n\t\t\t\telse\r\n\t\t\t\t\t--Chat.BroadcastMessage(\"Already studying \" .. subject.name, {players = observer})\r\n\t\t\t\tend\r\n\t\t\telse\r\n\t\t\t\t--Chat.BroadcastMessage(\"No player named \" .. playerName, {players = observer})\r\n\t\t\tend\r\n\t\telse\r\n\t\t\t--Chat.BroadcastMessage(\"Already studying.\", {players = observer})\r\n\t\tend\r\n\t-- This observer is not yet studying. Begin\r\n\telse\r\n\t\t--Chat.BroadcastMessage(\"Studying...\", {players = observer})\r\n\t\t\t\t\r\n\t\t-- Enable study in the observer\'s own data\r\n\t\tdata.isStudying = true\r\n\t\tobserver:SetResource(\"UserStudy_isObserver\", 1)\r\n\t\t\r\n\t\t-- Spawn spectator camera if necessary\r\n\t\tif not Object.IsValid(data.camera) then\r\n\t\t\tcamera = World.SpawnAsset(SPECTATOR_CAMERA)\r\n\t\t\tcamera:SetNetworkedCustomProperty(\"OwnerID\", observer.id)\r\n\t\t\tdata.camera = camera\r\n\t\tend\r\n\t\t\r\n\t\t-- Let other scripts and client know\r\n\t\tEvents.Broadcast(EVENT_STUDY_STARTED, observer)\r\n\t\tEvents.BroadcastToPlayer(observer, EVENT_STUDY_STARTED)\r\n\t\t\r\n\t\t-- Register in observers table\r\n\t\tAPI.activeObservers[observer] = true\r\n\t\t\r\n\t\t-- Increase observer count\r\n\t\tSetObserverCount(GetObserverCount() + 1)\r\n\t\t\r\n\t\t-- Connect action binding\r\n\t\tdata.bindingPressedListener = observer.bindingPressedEvent:Connect(OnBindingPressed)\r\n\t\t\t\t\r\n\t\t-- Attach observer so they can\'t move, etc\r\n\t\tif not Object.IsValid(data.attachmentObject) then\r\n\t\t\tlocal pos = observer:GetWorldPosition()\r\n\t\t\tlocal attachmentObject = World.SpawnAsset(ATTACHMENT_TEMPLATE, {position = pos})\r\n\t\t\tdata.attachmentObject = attachmentObject\r\n\t\tend\r\n\t\tobserver:AttachToCoreObject(data.attachmentObject)\r\n\t\t\r\n\t\t-- Disable observer\r\n\t\tobserver.isVisible = false\r\n\t\tobserver.isCollidable = false\r\n\t\t\r\n\t\t-- Additional command arguments\r\n\t\tif playerName then\r\n\t\t\tlocal subject = API.FindPlayerWithName(playerName)\r\n\t\t\tif subject then\r\n\t\t\t\tSetSubject(observer, subject)\r\n\t\t\telse\r\n\t\t\t\t--Chat.BroadcastMessage(\"No player named \" .. playerName, {players = observer})\r\n\t\t\t\tAPI.NextSubject(observer)\r\n\t\t\tend\r\n\t\telse\r\n\t\t\tAPI.NextSubject(observer)\r\n\t\tend\r\n\t\t\r\n\t\t-- In case no subject was found\r\n\t\tif not Object.IsValid(data.subject) then\r\n\t\t\t--Chat.BroadcastMessage(\"Waiting for subject.\", {players = observer})\r\n\t\tend\r\n\tend\r\nend\r\n\r\n-- Server\r\nfunction API.EndStudy(observer, arguments)\r\n\tif API.IsObserver(observer) then\r\n\t\t--observer.team = 1\r\n\t\r\n\t\t--Chat.BroadcastMessage(\"Ending study.\", {players = observer})\r\n\t\t\r\n\t\t-- Let other scripts and client know\r\n\t\tEvents.Broadcast(EVENT_STUDY_ENDED, observer)\r\n\t\tEvents.BroadcastToPlayer(observer, EVENT_STUDY_ENDED)\r\n\t\t\r\n\t\t-- Clear from observers table\r\n\t\tAPI.activeObservers[observer] = nil\r\n\t\t\r\n\t\t-- Decrease observer count\r\n\t\tSetObserverCount(GetObserverCount() - 1)\r\n\t\t\r\n\t\t-- Disable study in the observer\'s own data\r\n\t\tlocal data = GetStudyData(observer)\r\n\t\tdata.isStudying = false\r\n\t\tdata.subject = nil\r\n\t\tobserver:SetResource(\"UserStudy_isObserver\", 0)\r\n\t\t\r\n\t\t-- Cleanup action binding\r\n\t\tdata.bindingPressedListener:Disconnect()\r\n\t\tdata.bindingPressedListener = nil\r\n\t\t\r\n\t\t-- Detach camera\r\n\t\tif Object.IsValid(data.camera) then\r\n\t\t\tdata.camera:Detach()\r\n\t\t\tdata.camera:SetNetworkedCustomProperty(\"OwnerID\", \"\")\r\n\t\t\tdata.camera:Destroy()\r\n\t\tend\r\n\t\tdata.camera = nil\r\n\t\t\r\n\t\t-- Detach observer\r\n\t\tobserver:Detach()\r\n\t\t\r\n\t\t-- Enable observer\r\n\t\tobserver.isVisible = true\r\n\t\tobserver.isCollidable = true\r\n\t\t\r\n\t\tUpdateSubjectList()\r\n\telse\r\n\t\t--Chat.BroadcastMessage(\"Not currently studying.\", {players = observer})\r\n\tend\r\nend\r\n\r\n-- Server & Client\r\nfunction API.IsObserver(observer)\r\n\tif Environment.IsClient() then\r\n\t\treturn observer:GetResource(\"UserStudy_isObserver\") == 1\r\n\tend\r\n\tlocal data = GetStudyData(observer)\r\n\treturn data.isStudying\r\nend\r\n\r\n\r\nfunction SetSubject(observer, subject)\r\n\t--Chat.BroadcastMessage(\"Subject = \" .. subject.name, {players = observer})\r\n\t\r\n\t-- Save a reference to the subject into the observer\'s data\r\n\tlocal data = GetStudyData(observer)\r\n\tdata.subject = subject\r\n\t\r\n\tUpdateSubjectList()\r\n\t\r\n\t-- Setup spectator camera\r\n\tlocal camera = data.camera\r\n\tlocal pos = subject:GetWorldPosition()\r\n\t--local rot = subject:GetWorldRotation()\r\n\tif Object.IsValid(camera) then\r\n\t\tcamera:SetWorldPosition(pos)\r\n\t\t--camera:SetWorldRotation(rot)\r\n\telse\r\n\t\tcamera = World.SpawnAsset(SPECTATOR_CAMERA, {position = pos, rotation = rot})\r\n\t\tcamera:SetNetworkedCustomProperty(\"OwnerID\", observer.id)\r\n\t\tdata.camera = camera\r\n\tend\r\n\t\r\n\tcamera:AttachToPlayer(subject, CAMERA_ATTACHMENT_SOCKET)\r\n\t\r\n\t-- Let other scripts and client know\r\n\tEvents.Broadcast(EVENT_SUBJECT_CHANGED, observer, subject)\r\n\tEvents.BroadcastToPlayer(observer, EVENT_SUBJECT_CHANGED, subject)\r\nend\r\n\r\n-- Server\r\nfunction API.NextSubject(observer)\r\n\tlocal players = SortPlayersForNextPrev(observer)\r\n\tif players then\r\n\t\tSetSubject(observer, players[1])\r\n\tend\r\nend\r\n\r\n-- Server\r\nfunction API.PreviousSubject(observer)\r\n\tlocal players = SortPlayersForNextPrev(observer)\r\n\tif players then\r\n\t\tSetSubject(observer, players[#players])\r\n\tend\r\nend\r\n\r\nfunction SortPlayersForNextPrev(observer)\r\n\tlocal data = GetStudyData(observer)\r\n\tif not data.isStudying then\r\n\t\treturn nil\r\n\tend\r\n\t\r\n\tlocal players = Game.GetPlayers({ignorePlayers = observer})\r\n\tif #players <= 0 then\r\n\t\treturn nil\r\n\tend\r\n\t\r\n\tlocal currentSubject = data.subject\r\n\t\r\n\tif not Object.IsValid(currentSubject) then\r\n\t\treturn players\r\n\t\t\r\n\telseif #players == 1 and players[1] == currentSubject then\r\n\t\treturn nil\r\n\telse\r\n\t\tlocal sortedPlayers = {}\r\n\t\tlocal insertAt = 1\r\n\t\t\r\n\t\tfor i,p in ipairs(players) do\r\n\t\t\tif p == currentSubject then\r\n\t\t\t\tinsertAt = 1\r\n\t\t\t\t\r\n\t\t\telseif not API.IsObserver(p) then\r\n\t\t\t\ttable.insert(sortedPlayers, insertAt, p)\r\n\t\t\t\tinsertAt = insertAt + 1\r\n\t\t\tend\r\n\t\tend\r\n\t\treturn sortedPlayers\r\n\tend\r\n\treturn nil\r\nend\r\n\r\n\r\nfunction OnBindingPressed(observer, action)\r\n\t--print(\"Study action = \" .. action)\r\n\t\r\n\tif action == BINDING_NEXT_SUBJECT then\r\n\t\tAPI.NextSubject(observer)\r\n\t\r\n\telseif action == BINDING_PREV_SUBJECT then\r\n\t\tAPI.PreviousSubject(observer)\r\n\tend\r\nend\r\n\r\n\r\nfunction GetStudyData(observer)\r\n\tif not observer.serverUserData.userStudy then\r\n\t\tobserver.serverUserData.userStudy = {}\r\n\tend\r\n\treturn observer.serverUserData.userStudy\r\nend\r\n\r\n\r\nfunction API.FindPlayerWithName(name)\r\n\tname = string.lower(name)\r\n\tfor _,player in ipairs(Game.GetPlayers()) do\r\n\t\tif name == string.lower(player.name) then\r\n\t\t\treturn player\r\n\t\tend\r\n\tend\r\n\treturn nil\r\nend\r\n\r\n\r\nfunction OnPlayerJoined(player)\r\n\tif Environment.IsServer() then\r\n\t\tLoadAllOptions(player)\r\n\t\t\r\n\telseif Environment.IsClient() and player == Game.GetLocalPlayer() then\r\n\t\tplayer.resourceChangedEvent:Connect(OnLocalPlayerResourceChanged)\r\n\tend\r\n\t\r\n\tfor observer,_ in pairs(API.activeObservers) do\r\n\t\tlocal data = GetStudyData(observer)\r\n\t\tif data.isStudying and not Object.IsValid(data.subject) then\r\n\t\t\tAPI.NextSubject(observer)\r\n\t\tend\r\n\tend\r\nend\r\n\r\nfunction OnPlayerLeft(player)\r\n\t-- Server\r\n\tif Environment.IsServer() then\r\n\t\t-- If the player who left was an observer, end their study\r\n\t\tif API.activeObservers[player] then\r\n\t\t\tAPI.EndStudy(player)\r\n\t\tend\r\n\t\t\r\n\t\t-- Check if the player who left was a subject\r\n\t\tfor observer,_ in pairs(API.activeObservers) do\r\n\t\t\tlocal data = GetStudyData(observer)\r\n\t\t\tif data.isStudying and data.subject == player then\r\n\t\t\t\t--Chat.BroadcastMessage(\"Subject Left the game: \" .. player.name, {players = observer})\r\n\t\t\t\r\n\t\t\t\tdata.attachmentObject:Detach()\r\n\t\t\t\t\r\n\t\t\t\tTask.Wait(0.5)\r\n\t\t\t\tif not Object.IsValid(observer) then return end\r\n\t\t\t\t\r\n\t\t\t\tAPI.NextSubject(observer)\r\n\t\t\t\t\r\n\t\t\t\tif not Object.IsValid(data.subject) then\r\n\t\t\t\t\t-- Let other scripts and client know\r\n\t\t\t\t\tEvents.Broadcast(EVENT_SUBJECT_CHANGED, observer, nil)\r\n\t\t\t\t\tEvents.BroadcastToPlayer(observer, EVENT_SUBJECT_CHANGED, nil)\r\n\t\t\t\tend\r\n\t\t\tend\r\n\t\tend\r\n\t\t\r\n\t\tUpdateSubjectList()\r\n\t\t\r\n\t-- Client\r\n\telseif Environment.IsClient() then\r\n\t\tAPI.activeSubjects[player] = nil\r\n\tend\r\nend\r\n\r\nGame.playerJoinedEvent:Connect(OnPlayerJoined)\r\nGame.playerLeftEvent:Connect(OnPlayerLeft)\r\n\r\n\r\n-- Client\r\nfunction API.BroadcastToObservers(eventName, ...)\r\n\tlocal subject = Game.GetLocalPlayer()\r\n\tif not API.IsSubject(subject) then return end\r\n\t\r\n\tif GetObserverCount() > 0 then\r\n\t\tEvents.BroadcastToServer(EVENT_REDIRECT_BROADCAST, eventName, ...)\r\n\tend\r\nend\r\n\r\n-- Server\r\nfunction OnRedirectEvent(subject, eventName, ...)\r\n\tif API.IsObserver(subject) then return end\r\n\t\r\n\tfor observer,_ in pairs(API.activeObservers) do\r\n\t\tlocal data = GetStudyData(observer)\r\n\t\tif data.subject == subject and Object.IsValid(subject) then\r\n\t\t\tEvents.BroadcastToPlayer(observer, eventName, ...)\r\n\t\tend\r\n\tend\r\nend\r\n\r\nif Environment.IsServer() then\r\n\tEvents.ConnectForPlayer(EVENT_REDIRECT_BROADCAST, OnRedirectEvent)\r\nend\r\n\r\n\r\n-- Client / Server\r\nfunction GetObserverCount()\r\n\tif API.networkedObject then\r\n\t\treturn API.networkedObject:GetCustomProperty(\"ObserverCount\")\r\n\tend\r\n\treturn 0\r\nend\r\n\r\n-- Server\r\nfunction SetObserverCount(value)\r\n\tif API.networkedObject then\r\n\t\tAPI.networkedObject:SetNetworkedCustomProperty(\"ObserverCount\", value)\r\n\tend\r\nend\r\n\r\n\r\n-- Client / Server\r\nfunction API.IsSubject(player)\r\n\treturn API.activeSubjects[player]\r\nend\r\n\r\n-- Client / Server\r\nfunction API.GetSubjectNames()\r\n\tlocal str = API.networkedObject:GetCustomProperty(\"Subjects\")\r\n\tlocal result = {CoreString.Split(str, \",\")}\r\n\treturn result\r\nend\r\n\r\n-- Server\r\nfunction UpdateSubjectList()\r\n\tAPI.activeSubjects = {}\r\n\tlocal listOfNames = \"\"\r\n\tlocal count = 0\r\n\tfor observer,_ in pairs(API.activeObservers) do\r\n\t\tlocal data = GetStudyData(observer)\r\n\t\tif Object.IsValid(data.subject) then\r\n\t\t\tAPI.activeSubjects[data.subject] = true\r\n\t\t\t\r\n\t\t\tif count > 0 then\r\n\t\t\t\tlistOfNames = listOfNames .. \",\"\r\n\t\t\tend\r\n\t\t\tlistOfNames = listOfNames .. data.subject.name\r\n\t\t\tcount = count + 1\r\n\t\tend\r\n\tend\r\n\tAPI.networkedObject:SetNetworkedCustomProperty(\"Subjects\", listOfNames)\r\nend\r\n\r\n-- Client\r\nfunction OnNetworkedPropertyChanged(obj, propertyName)\r\n\tif propertyName == \"Subjects\" then\r\n\t\tlocal localPlayer = Game.GetLocalPlayer()\r\n\t\tlocal localWasSubject = API.activeSubjects[localPlayer]\r\n\t\t\r\n\t\tAPI.activeSubjects = {}\r\n\t\t\t\t\r\n\t\tlocal subjectNames = API.GetSubjectNames()\r\n\t\tfor _,name in ipairs(subjectNames) do\r\n\t\t\tlocal subject = API.FindPlayerWithName(name)\r\n\t\t\tif Object.IsValid(subject) then\r\n\t\t\t\tAPI.activeSubjects[subject] = true\r\n\t\t\tend\r\n\t\tend\r\n\t\t\r\n\t\tif localWasSubject and not API.activeSubjects[localPlayer] then\r\n\t\t\tEvents.Broadcast(EVENT_LOCAL_PLAYER_IS_SUBJECT, false)\r\n\t\t\t\r\n\t\telseif not localWasSubject and API.activeSubjects[localPlayer] then\r\n\t\t\tEvents.Broadcast(EVENT_LOCAL_PLAYER_IS_SUBJECT, true)\r\n\t\tend\r\n\tend\r\nend\r\n\r\n-- Server\r\n-- Options are tool settings/preferences, e.g. view indicator on/off\r\nfunction API.ResetAllOptionsToDefault(observer)\r\n\tlocal data = Storage.GetPlayerData(observer)\r\n\t\r\n\tdata.UserStudy = nil\r\n\t\r\n\tStorage.SetPlayerData(observer, data)\r\n\t\r\n\tLoadAllOptions(observer)\r\n\tSaveAllOptions(observer)\r\n\t\r\n\tChat.BroadcastMessage(\"All options are reset to default.\", {players = observer})\r\nend\r\n\r\n-- Server\r\nfunction API.ListAllOptions(observer)\r\n\tChat.BroadcastMessage(\"Options:\", {players = observer})\r\n\tListOption(observer, \"resolution\", \"res\")\r\n\tListOption(observer, \"view\", \"view\")\r\nend\r\nfunction ListOption(observer, displayName, optionName)\r\n\tlocal strValue = \"off\"\r\n\tif API.GetOption(observer, optionName) then\r\n\t\tstrValue = \"on\"\r\n\tend\r\n\tChat.BroadcastMessage(displayName .. \" = \" .. strValue, {players = observer})\r\nend\r\n\r\n-- Server\r\nfunction API.ToggleResolution(observer, enabled)\r\n\tif enabled then\r\n\t\tChat.BroadcastMessage(\"Enabling screen resolution label.\", {players = observer})\r\n\telse\r\n\t\tChat.BroadcastMessage(\"Disabling screen resolution label.\", {players = observer})\r\n\tend\r\n\t\r\n\tSaveOption(observer, \"res\", enabled)\r\nend\r\n\r\n-- Server\r\nfunction API.ToggleViewIndicator(observer, enabled)\r\n\tif enabled then\r\n\t\tChat.BroadcastMessage(\"Enabling view indicator.\", {players = observer})\r\n\telse\r\n\t\tChat.BroadcastMessage(\"Disabling view indicator.\", {players = observer})\r\n\tend\r\n\t\r\n\tSaveOption(observer, \"view\", enabled)\r\nend\r\n\r\n-- Server\r\nfunction LoadAllOptions(observer)\r\n\tAPI.SetOption(observer, \"res\", LoadOption(observer, \"res\", true))\r\n\tAPI.SetOption(observer, \"view\", LoadOption(observer, \"view\", true))\r\nend\r\n\r\n-- Server\r\nfunction SaveAllOptions(observer)\r\n\tSaveOption(observer, \"res\", API.GetOption(observer, \"res\"))\r\n\tSaveOption(observer, \"view\", API.GetOption(observer, \"view\"))\r\nend\r\n\r\n-- Server\r\nfunction LoadOption(observer, optionName, defaultValue)\r\n\tlocal data = Storage.GetPlayerData(observer)\r\n\t\r\n\tif not data.UserStudy then\r\n\t\treturn defaultValue\r\n\tend\r\n\tif data.UserStudy[optionName] ~= nil then\r\n\t\treturn data.UserStudy[optionName]\r\n\tend\r\n\treturn defaultValue\r\nend\r\n\r\n-- Server\r\nfunction SaveOption(observer, optionName, value)\r\n\tif value == nil then return end\r\n\t\r\n\tlocal data = Storage.GetPlayerData(observer)\r\n\t\r\n\tif not data.UserStudy then\r\n\t\tdata.UserStudy = {}\r\n\tend\r\n\t\r\n\tdata.UserStudy[optionName] = value\r\n\t\r\n\tStorage.SetPlayerData(observer, data)\r\n\t\r\n\tAPI.SetOption(observer, optionName, value)\r\nend\r\n\r\n-- Server & Client\r\nfunction API.GetOption(observerOrSubject, optionName)\r\n\tif Environment.IsClient() then\r\n\t\treturn observerOrSubject:GetResource(\"UserStudy_\" .. optionName) == 1\r\n\tend\r\n\tlocal studyData = GetStudyData(observerOrSubject)\r\n\treturn studyData[optionName]\r\nend\r\n\r\n-- Server\r\nfunction API.SetOption(observer, optionName, value)\r\n\tlocal studyData = GetStudyData(observer)\r\n\tstudyData[optionName] = value\r\n\t\r\n\tlocal resName = \"UserStudy_\" .. optionName\r\n\tlocal resValue = 0\r\n\tif value then\r\n\t\tresValue = 1\r\n\tend\r\n\t\r\n\t-- Replicate option to observer\r\n\tobserver:SetResource(resName, resValue)\r\n\t\r\n\t-- Replicate option to subject\r\n\tif Object.IsValid(studyData.subject) then\r\n\t\tstudyData.subject:SetResource(resName, resValue)\r\n\tend\r\nend\r\n\r\n-- Server\r\nfunction ReplicateAllOptionsToSubject(observer)\r\n\t-- TODO\r\nend\r\n\r\n-- Client\r\nfunction OnLocalPlayerResourceChanged(player, resName, resAmount)\r\n\tlocal prefix = \"UserStudy_\"\r\n\tlocal len = string.len(prefix)\r\n\tif string.sub(resName, 1, len) == prefix then\r\n\t\tlocal optionName = string.sub(resName, len + 1)\r\n\t\tlocal optionValue = (resAmount == 1)\r\n\t\tEvents.Broadcast(EVENT_OPTION_CHANGED, optionName, optionValue)\r\n\tend\r\nend\r\n\r\n-- Server & Client\r\nfunction API.RemoveObservers(playerArray)\r\n\tfor i = #playerArray, 1, -1 do\r\n\t\tif API.IsObserver(playerArray[i]) then\r\n\t\t\ttable.remove(playerArray, i)\r\n\t\tend\r\n\tend\r\nend\r\n\r\nreturn API\r\n\r\n\r\n\r\n\r\n\r\n"
        CustomParameters {
          Overrides {
            Name: "cs:AttachmentTemplate"
            AssetReference {
              Id: 84735743215772271
            }
          }
          Overrides {
            Name: "cs:SpectatorCamera"
            AssetReference {
              Id: 440984951018104342
            }
          }
          Overrides {
            Name: "cs:AttachmentTemplate:tooltip"
            String: "Template of an invisible object that is used for \"trapping\" the observer while a study is active. The observing player is attached to this object."
          }
          Overrides {
            Name: "cs:SpectatorCamera:tooltip"
            String: "Template of a spectator camera that is spawned for each observer when they start a study."
          }
        }
      }
    }
    Assets {
      Id: 440984951018104342
      Name: "UserStudy Spectator Camera"
      PlatformAssetType: 5
      TemplateAsset {
        ObjectBlock {
          RootId: 936594431711656664
          Objects {
            Id: 936594431711656664
            Name: "UserStudy Spectator Camera"
            Transform {
              Scale {
                X: 1
                Y: 1
                Z: 1
              }
            }
            ParentId: 4781671109827199097
            ChildIds: 10814231185815823091
            UnregisteredParameters {
              Overrides {
                Name: "cs:OwnerID"
                String: ""
              }
              Overrides {
                Name: "cs:OwnerID:isrep"
                Bool: true
              }
            }
            WantsNetworking: true
            Collidable_v2 {
              Value: "mc:ecollisionsetting:forceoff"
            }
            Visible_v2 {
              Value: "mc:evisibilitysetting:inheritfromparent"
            }
            CameraCollidable {
              Value: "mc:ecollisionsetting:inheritfromparent"
            }
            EditorIndicatorVisibility {
              Value: "mc:eindicatorvisibility:visiblewhenselected"
            }
            NetworkContext {
            }
          }
          Objects {
            Id: 10814231185815823091
            Name: "UserStudyCamera"
            Transform {
              Location {
              }
              Rotation {
              }
              Scale {
                X: 1
                Y: 1
                Z: 1
              }
            }
            ParentId: 936594431711656664
            ChildIds: 11170835267785700953
            UnregisteredParameters {
              Overrides {
                Name: "cs:Camera"
                ObjectReference {
                  SubObjectId: 11170835267785700953
                }
              }
            }
            Collidable_v2 {
              Value: "mc:ecollisionsetting:inheritfromparent"
            }
            Visible_v2 {
              Value: "mc:evisibilitysetting:inheritfromparent"
            }
            CameraCollidable {
              Value: "mc:ecollisionsetting:inheritfromparent"
            }
            EditorIndicatorVisibility {
              Value: "mc:eindicatorvisibility:visiblewhenselected"
            }
            Script {
              ScriptAsset {
                Id: 11525943319786062334
              }
            }
          }
          Objects {
            Id: 11170835267785700953
            Name: "Camera"
            Transform {
              Location {
                Z: -60
              }
              Rotation {
              }
              Scale {
                X: 1
                Y: 1
                Z: 1
              }
            }
            ParentId: 10814231185815823091
            Collidable_v2 {
              Value: "mc:ecollisionsetting:inheritfromparent"
            }
            Visible_v2 {
              Value: "mc:evisibilitysetting:inheritfromparent"
            }
            CameraCollidable {
              Value: "mc:ecollisionsetting:inheritfromparent"
            }
            EditorIndicatorVisibility {
              Value: "mc:eindicatorvisibility:visiblewhenselected"
            }
            Camera {
              FreeControl: true
              InitialDistance: 400
              IsDistanceAdjustable: true
              MinDistance: 100
              MaxDistance: 1600
              PositionOffset {
              }
              RotationOffset {
              }
              FieldOfView: 90
              ViewWidth: 1200
              RotationMode {
                Value: "mc:erotationmode:default"
              }
              MinPitch: -89
              MaxPitch: 89
              DoesPositionOffsetSpring: true
            }
          }
        }
        PrimaryAssetId {
          AssetType: "None"
          AssetId: "None"
        }
      }
    }
    Assets {
      Id: 11525943319786062334
      Name: "UserStudyCamera"
      PlatformAssetType: 3
      TextAsset {
        Text: "--[[\r\n\tUser Study - Camera\r\n\tv1.1\r\n\tby: standardcombo\r\n\t\r\n\tSpectator camera that follows the subject around. The camera\'s\r\n\tnetworking root is attached to the subject by the API script.\r\n\tThis handles all the client-side aspects of the camera.\r\n--]]\r\n\r\nlocal ROOT = script.parent\r\nlocal CAMERA = script:GetCustomProperty(\"Camera\"):WaitForObject()\r\n\r\nlocal PLAYER = Game.GetLocalPlayer()\r\n\r\nlocal isActive = false\r\nlocal eventListeners = {}\r\n\r\n-- Detach the client-side hierarchy from the networked root\r\n-- This gives the camera much smoother movement.\r\nscript.parent = nil\r\nscript:Follow(ROOT)\r\n\r\n-- Observer is the local player in this case. They are assigned the camera\r\nfunction OnStudyStarted()\r\n\tisActive = true\r\n\tPLAYER:SetOverrideCamera(CAMERA)\r\nend\r\n\r\n-- Observer is the local player. Their camera is reverted to default\r\nfunction OnStudyEnded()\r\n\tisActive = false\r\n\tPLAYER:ClearOverrideCamera()\r\nend\r\n\r\ntable.insert(eventListeners, Events.Connect(\"Study_Start\", OnStudyStarted))\r\ntable.insert(eventListeners, Events.Connect(\"Study_End\", OnStudyEnded))\r\n\r\n-- For some games, the observer needs to keep re-assigning the camera\r\nfunction Tick()\r\n\tif isActive then\r\n\t\tlocal activeCam = PLAYER:GetActiveCamera()\r\n\t\tif activeCam ~= CAMERA and activeCam == PLAYER:GetDefaultCamera() then\r\n\t\t\tPLAYER:SetOverrideCamera(CAMERA)\r\n\t\tend\r\n\tend\r\nend\r\n\r\n-- Cleanup event listeners, because the spectator camera is not permanent\r\nfunction OnDestroy()\r\n\tfor _,e in ipairs(eventListeners) do\r\n\t\te:Disconnect()\r\n\t\te = nil\r\n\tend\r\n\teventListeners = nil\r\nend\r\ntable.insert(eventListeners, script.destroyEvent:Connect(OnDestroy))\r\n\r\n-- The camera\'s networked root has an \"OwnerID\" property that changes to match\r\n-- the ID of the observer for which this camera was spawned for.\r\nfunction OnNetworkedPropertyChanged(obj, propertyName)\r\n\tif propertyName == \"OwnerID\" then\r\n\t\tlocal id = obj:GetCustomProperty(propertyName)\r\n\t\tlocal player = Game.FindPlayer(id)\r\n\t\tif Object.IsValid(player) and player == PLAYER then\r\n\t\t\tOnStudyStarted()\r\n\t\tend\r\n\tend\r\nend\r\n\r\ntable.insert(eventListeners, ROOT.networkedPropertyChangedEvent:Connect(OnNetworkedPropertyChanged))\r\nTask.Wait()\r\nOnNetworkedPropertyChanged(ROOT, \"OwnerID\")\r\n\r\n"
        CustomParameters {
          Overrides {
            Name: "cs:Camera"
            ObjectReference {
            }
          }
          Overrides {
            Name: "cs:Camera:tooltip"
            String: "Reference to the client camera that is following the subject. This camera will be set as the override for the observer."
          }
        }
      }
    }
    Assets {
      Id: 84735743215772271
      Name: "UserStudyAttachmentTemplate"
      PlatformAssetType: 5
      TemplateAsset {
        ObjectBlock {
          RootId: 6328741192631086635
          Objects {
            Id: 6328741192631086635
            Name: "UserStudyAttachmentTemplate"
            Transform {
              Scale {
                X: 1
                Y: 1
                Z: 1
              }
            }
            ParentId: 4781671109827199097
            ChildIds: 3442801009753606864
            WantsNetworking: true
            Collidable_v2 {
              Value: "mc:ecollisionsetting:forceoff"
            }
            Visible_v2 {
              Value: "mc:evisibilitysetting:inheritfromparent"
            }
            CameraCollidable {
              Value: "mc:ecollisionsetting:forceoff"
            }
            EditorIndicatorVisibility {
              Value: "mc:eindicatorvisibility:visiblewhenselected"
            }
            Folder {
              IsGroup: true
            }
          }
          Objects {
            Id: 3442801009753606864
            Name: "Cube"
            Transform {
              Location {
              }
              Rotation {
              }
              Scale {
                X: 0.5
                Y: 0.5
                Z: 0.5
              }
            }
            ParentId: 6328741192631086635
            WantsNetworking: true
            Collidable_v2 {
              Value: "mc:ecollisionsetting:forceoff"
            }
            Visible_v2 {
              Value: "mc:evisibilitysetting:forceoff"
            }
            CameraCollidable {
              Value: "mc:ecollisionsetting:forceoff"
            }
            EditorIndicatorVisibility {
              Value: "mc:eindicatorvisibility:visiblewhenselected"
            }
            CoreMesh {
              MeshAsset {
                Id: 12095835209017042614
              }
              Teams {
                IsTeamCollisionEnabled: true
                IsEnemyCollisionEnabled: true
              }
              StaticMesh {
                Physics {
                  Mass: 100
                  LinearDamping: 0.01
                }
                BoundsScale: 1
              }
            }
          }
        }
        PrimaryAssetId {
          AssetType: "None"
          AssetId: "None"
        }
      }
    }
    Assets {
      Id: 12095835209017042614
      Name: "Cube"
      PlatformAssetType: 1
      PrimaryAsset {
        AssetType: "StaticMeshAssetRef"
        AssetId: "sm_cube_002"
      }
    }
    Assets {
      Id: 15479419207500979944
      Name: "UserStudyServer"
      PlatformAssetType: 3
      TextAsset {
        Text: "--[[\r\n\tUser Study - Server\r\n\tv1.1\r\n\tby: standardcombo\r\n\t\r\n\tHandles setup on the server-side.\r\n--]]\r\n\r\nlocal API = require( script:GetCustomProperty(\"UserStudyAPI\") )\r\nlocal NETWORKED_OBJECT = script:GetCustomProperty(\"NetworkedObject\"):WaitForObject()\r\n\r\n_G.UserStudy = API\r\n\r\nAPI.RegisterNetworkedObject(NETWORKED_OBJECT)\r\n\r\n"
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
    }
    Assets {
      Id: 4572443722256424580
      Name: "BroadcasterChatCommands"
      PlatformAssetType: 3
      TextAsset {
        Text: "--[[\r\n\tBroadcaster - Chat Commands\r\n\tv1.1\r\n\tby: standardcombo\r\n\t\r\n\tIntercepts text written in the chat. If it\'s formatted as a command,\r\n\tthen it will be forwarded to the API, at the appropriate function\r\n\tthat matches the command.\r\n--]]\r\n\r\nlocal API = require( script:GetCustomProperty(\"UserStudyAPI\") )\r\nlocal ADMINS_CSS = script:GetCustomProperty(\"Admins\")\r\n\r\n-- Pre-process the list of admins who are allowed to use the commands\r\nlocal ADMINS = {}\r\nlocal adminTable = { CoreString.Split(ADMINS_CSS, \",\") }\r\nfor _,name in ipairs(adminTable) do\r\n\tname = CoreString.Trim(name)\r\n\tADMINS[name] = true\r\nend\r\n\r\n\r\nfunction OnReceiveMessageHook(player, params)\r\n\tif not ADMINS[player.name] then return end\r\n\t\r\n\tlocal message = params.message\r\n\tif #message <= 0 then return end\r\n\tif string.sub(message, 1, 1) ~= \"/\" then return end\r\n\t\r\n\t-- Don\'t show the command in chat\r\n\tparams.message = \"\"\r\n\t\t\r\n\t--print(\"message = \" .. message)\r\n\t\r\n\tlocal command, arg1, arg2, arg3, arg4 = CoreString.Split(message)\r\n\tlocal arguments = {arg1, arg2, arg3, arg4}\r\n\t\r\n\tcommand = string.lower(command)\r\n\t\r\n\t-- We need to spawn task because yielding the thread is not allowed inside a hook\r\n\tTask.Spawn(function()\r\n\t\tif not Object.IsValid(player) then return end\r\n\t\t\r\n\t\tif command == \"/start\" then\r\n\t\t\tAPI.BeginStudy(player, arguments)\r\n\t\t\t\t\t\t\r\n\t\telseif command == \"/end\" then\r\n\t\t\tAPI.EndStudy(player, arguments)\r\n\t\t\t\r\n\t\telseif command == \"/setteam\" then\r\n\t\t\tSetPlayerTeam(player, arg1, arg2)\r\n\t\t\t\r\n\t\telseif command == \"/spawn\" then\r\n\t\t\tSpawnPlayer(player, arg1)\r\n\t\t\r\n\t\telseif command == \"/endround\" then\r\n\t\t\tGame.EndRound()\r\n\t\t\t\r\n\t\telseif command == \"/startround\" then\r\n\t\t\tGame.StartRound()\r\n\t\t\t\r\n\t\telseif command == \"/kick\" then\r\n\t\t\tKickPlayer(player, arg1)\r\n\t\t\t\r\n\t\telseif command == \"/next\" then\r\n\t\t\tAPI.NextSubject(player)\r\n\t\t\t\r\n\t\telseif command == \"/prev\" then\r\n\t\t\tAPI.PreviousSubject(player)\r\n\t\t\t\r\n\t\telseif command == \"/options\" then\r\n\t\t\tAPI.ListAllOptions(player)\r\n\t\t\r\n\t\telseif command == \"/defaults\" then\r\n\t\t\tAPI.ResetAllOptionsToDefault(player)\r\n\t\t\t\r\n\t\t--elseif command == \"/resolution\" then\r\n\t\t--\tToggleResolution(player, arguments)\r\n\t\t\t\r\n\t\t--elseif command == \"/view\" then\r\n\t\t--\tToggleViewIndicator(player, arguments)\r\n\t\tend\r\n\tend)\r\nend\r\n\r\nChat.receiveMessageHook:Connect(OnReceiveMessageHook)\r\n\r\n\r\nfunction SetPlayerTeam(adminPlayer, playerName, teamNumber)\r\n\tlocal teamNumber = tonumber(teamNumber)\r\n\tif teamNumber then\r\n\t\tlocal player = API.FindPlayerWithName(playerName)\r\n\t\tif player then\r\n\t\t\tplayer.team = CoreMath.Round(teamNumber)\r\n\t\telse\r\n\t\t\tChat.BroadcastMessage(\"Could not find player named \" .. playerName, {players = adminPlayer})\r\n\t\tend\r\n\tend\r\nend\r\n\r\n\r\nfunction SpawnPlayer(adminPlayer, playerName)\r\n\tlocal player = API.FindPlayerWithName(playerName)\r\n\tif player then\r\n\t\tplayer:Spawn({spawnKey = \"\"})\r\n\telse\r\n\t\tChat.BroadcastMessage(\"Could not find player named \" .. playerName, {players = adminPlayer})\r\n\tend\r\nend\r\n\r\n\r\nfunction KickPlayer(adminPlayer, playerName)\r\n\tlocal player = API.FindPlayerWithName(playerName)\r\n\tif player then\r\n\t\tplayer:TransferToGame(\"e39f3e/core-world\")\r\n\telse\r\n\t\tChat.BroadcastMessage(\"Could not find player named \" .. playerName, {players = adminPlayer})\r\n\tend\r\nend\r\n\r\nfunction ToggleResolution(player, arguments)\r\n\tlocal value = arguments[1]\r\n\tif value and string.lower(value) == \"on\" then\r\n\t\tAPI.ToggleResolution(player, true)\r\n\t\r\n\telseif value and string.lower(value) == \"off\" then\r\n\t\tAPI.ToggleResolution(player, false)\r\n\telse\r\n\t\tChat.BroadcastMessage(\"Use command \'/resolution on\' or \'/resolution off\'\", {players = observer})\r\n\tend\r\nend\r\n\r\n\r\nfunction ToggleViewIndicator(player, arguments)\r\n\tlocal value = arguments[1]\r\n\tif value and string.lower(value) == \"on\" then\r\n\t\tAPI.ToggleViewIndicator(player, true)\r\n\t\r\n\telseif value and string.lower(value) == \"off\" then\r\n\t\tAPI.ToggleViewIndicator(player, false)\r\n\telse\r\n\t\tChat.BroadcastMessage(\"Use command \'/view on\' or \'/view off\'\", {players = observer})\r\n\tend\r\nend\r\n\r\n"
        CustomParameters {
          Overrides {
            Name: "cs:UserStudyAPI"
            AssetReference {
              Id: 4351186339395260028
            }
          }
          Overrides {
            Name: "cs:Admins"
            String: "standardcombo, Bot1"
          }
          Overrides {
            Name: "cs:UserStudyAPI:tooltip"
            String: "Reference to the API script, that will be required."
          }
          Overrides {
            Name: "cs:Admins:tooltip"
            String: "Comma-separated list of players who will have access to the User Study tool. Only these users will be able to use the chat commands."
          }
        }
      }
    }
    Assets {
      Id: 8134322410980958869
      Name: "Broadcaster_README"
      PlatformAssetType: 3
      TextAsset {
        Text: "--[[\r\n\tBroadcaster\r\n\tv1.0\r\n\tby: standardcombo\r\n\t\r\n\tBased on the User Study component, Broadcaster allows a select set\r\n\tof players to act as invisible observers to the game. Once they\r\n\tenter Observer mode, they can click LMB/RMB to navigate between\r\n\tand observe different players. They also have some admin commands\r\n\taimed at helping organize competitive matches, such as setting\r\n\tplayers to specific teams.\r\n\t\r\n\t\r\n\tSetup\r\n\t=====\r\n\t1. Add a copy of the `Broadcaster` template to the hierarchy. Place it\r\n\t   below all other UI, so that any UI elements therein can draw on top.\r\n\t2. Expand the `UserStudy` template.\r\n\t3. Select the script `UserStudyChatCommands`.\r\n\t4. In the Properties view, edit the `Admins`. These are the players that\r\n\t   will be able to use the commands.\r\n\t5. If your game has player nameplates (common), modify it so the observer\r\n\t   can see the nameplates on all players. See below.\r\n\t6. Other common game changes are listed in the sections below.\r\n\t\r\n\t\r\n\tTerminology\r\n\t===========\r\n\tObserver - The player who is an admin and initiates the study.\r\n\tSubject - The player that is being observed.\r\n\tReplication - Moving data across the network, so it\'s the same between\r\n\t              two different computers.\r\n\t\r\n\r\n\tUsage\r\n\t=====\r\n\t1. Start the game in multiplayer.\r\n\t2. Open the chat (Enter key) and type: /start\r\n\t   This will only work for players who\'s names are in the Admin list.\r\n\t3. If there are other player present, it will automatically observe them.\r\n\t   If not, then as soon as another player joins they will be observed.\r\n\t4. To end the observation, open the chat and type: /end\r\n\t\r\n\t\r\n\tChat Commands\r\n\t=============\r\n\t/start\t\t- Starts observing a player and hides your avatar.\r\n\t/end\t\t- Stops observing and respawns your avatar.\r\n\t/setteam <playername> <teamnumber>\t- Changes a player to a specific team.\r\n\t/spawn <playername>\t- Respawns a specific player. The game must have a\r\n\t                      Spawn settings object for this to work.\r\n\t/kick <playername>\t- Transfers the player back to Core World.\r\n\t/endround\t- Calls the API function Game.EndRound().\r\n\t/startround\t- Calls the API function Game.StartRound().\r\n\t\r\n\t\r\n\tNameplates\r\n\t==========\r\n\t\r\n\tFor the observers to see the nameplates of all players, modify the\r\n\tfunction IsNameplateVisible() in NameplateControllerClient.lua\r\n\tAdd the following code inside the function, at the top:\r\n\t```\r\n\tif _G.UserStudy and _G.UserStudy.IsObserver(LOCAL_PLAYER) then\r\n\t\treturn not _G.UserStudy.IsObserver(player)\r\n\tend\r\n\t```\r\n\t\r\n\t\r\n\tHide UI\r\n\t=======\r\n\t\r\n\tIt\'s usually the case that some UI elements should be hidden to the\r\n\tbroadcast observer. UI such as FPS meter, ability buttons, etc:\r\n\t\r\n\t1. Locate the UI you wish to hide in the hierarchy.\r\n\t2. Add a copy of the `DisableIfObserver` script as a child of the\r\n\t   upmost UI Container or UI Panel that you are hiding.\r\n\t   \r\n\tThe choice of UI that should be hidden will depend on the game.\r\n\t\r\n\t\r\n\tLists of Players\r\n\t================\r\n\t\r\n\tOften, games use the function Game.GetPlayers() to populate UI and even\r\n\tmake gameplay decisions, such as round start/end. Most of the time you\r\n\tshould exclude observers from those lists. The best way to do that is\r\n\tto search the whole codebase for usage of Game.GetPlayers(). For each\r\n\tone, add the following code to trim observers from the table of players:\r\n\t```\r\n\t_G.UserStudy.RemoveObservers(players)\r\n\t```\r\n\tFor example:\r\n\t```\r\n\tlocal players = Game.GetPlayers()\r\n\t_G.UserStudy.RemoveObservers(players)\r\n\tfor _,player in ipairs(players) do\r\n\t\t-- Populate scoreboard UI\r\n\tend\r\n\t```\r\n\t\r\n\tCamera\r\n\t======\r\n\tSome games may have unique camera perspectives that can impact the best\r\n\tviewing experience for observers. In such a case, the extra camera that\r\n\tis spawned for the observer can be modified to best fit the game.\r\n\tThe camera can be found in the template `User Study Spectator Camera`.\r\n\t\r\n\t\r\n\tNetworked Events\r\n\t================\r\n\tIn some games, it may be necessary to send an event to the observer in\r\n\torder for them to see the same thing that the subject is seeing. This can\r\n\tbe done with the following function:\r\n\t```\r\n\t_G.UserStudy.BroadcastToObservers(\"EventName\", ...)\r\n\t```\r\n\tThis is similar to the Core API function `Events.BroadcastToServer`,\r\n\texcept in this case the event goes from client-to-client; in other words,\r\n\tfrom subject-to-observer.\r\n\t\r\n--]]\r\n\r\n\r\n"
      }
    }
    Assets {
      Id: 1985159602667540743
      Name: "Broadcaster_README"
      PlatformAssetType: 5
      TemplateAsset {
        ObjectBlock {
          RootId: 14614349323114670552
          Objects {
            Id: 14614349323114670552
            Name: "Broadcaster_README"
            Transform {
              Scale {
                X: 1
                Y: 1
                Z: 1
              }
            }
            ParentId: 4781671109827199097
            Collidable_v2 {
              Value: "mc:ecollisionsetting:inheritfromparent"
            }
            Visible_v2 {
              Value: "mc:evisibilitysetting:inheritfromparent"
            }
            CameraCollidable {
              Value: "mc:ecollisionsetting:inheritfromparent"
            }
            EditorIndicatorVisibility {
              Value: "mc:eindicatorvisibility:visiblewhenselected"
            }
            Script {
              ScriptAsset {
                Id: 8134322410980958869
              }
            }
          }
        }
        PrimaryAssetId {
          AssetType: "None"
          AssetId: "None"
        }
      }
    }
    PrimaryAssetId {
      AssetType: "None"
      AssetId: "None"
    }
  }
  Marketplace {
    Id: "567f94d1da024b1a878a95733fd7f2c0"
    OwnerAccountId: "b4c6e32137e54571814b5e8f27aa2fcd"
    OwnerName: "standardcombo"
  }
  SerializationVersion: 91
}
IncludesAllDependencies: true
