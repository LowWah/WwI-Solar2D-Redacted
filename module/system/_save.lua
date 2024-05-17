local M = {}

--Store this as a local and reference values using functions
local save = {}

M.writeSave = function()
    MAIN.SYSTEM.FILE.writeJson(CONSTANTS.fileSave, save)
end

--Get the whole save, probably shouldnt do this but whatever
M.getSave = function()
    --We should have an initialize in every module which references the required save info for that module, e.g actors for members, inventory for inventory etc
    return save
end

M.initializeSave = function()
    save = MAIN.SYSTEM.FILE.readJson(CONSTANTS.fileSave, system.DocumentsDirectory)
    if not save then
        print('No save found - creating default')
        --DEFAULT SAVE
        --All objects will be set as keys for convience, it might be better to turn some to arrays but json.encode sometimes breaks it
        save = {
            time=0,
            actors={},
            inventory={
                {}, --general
                {}, --token
                {}, --tome
                {}, --gem
                {}, --weapon
                {}, --body
                {}, --head
                {}, --leg
                {} --accessory
            },
            quests={
                main={
                    {}, {}, {}, {}, {}, {}, {}, {}, {}, {}, {}
                },
                side={
                    {}, {}, {}, {}
                },
                event={
                    {}, {}, {}
                },
                gear={
                    {}, {}, {}, {}, {}, {}
                },
                tome={
                    {}, {}, {}, {}, {}, {}
                },
                onslaught={
                    {}, {}, {}, {}, {}, {}
                },
                arena={ --this tracks challenge completions
                    false, false, false, false, false
                },
                tower={
                    {}, {}, {}, {}, {}, {}, {}, {}, {}, {}
                },
                labyrinth={},
                other={ --this is for dialogue
                    {}, --tower
                    {}, --arena
                    {} --labyrinth
                }
            },
            gold=5000,
            guild={
                level=1,
                exp=0
            },        
            lives={
                lives=0,
                time=0
            },
            hub={
                background='OGA-Background-1',
                profile={
                    actorId=15,
                    skin=1
                },
                audio={
                    hub='Theme2',
                    battle='Scene1'
                }
            },
            gacha={
                featured={
                    first=true,
                    actor=0,
                    bonus={
                        count=0,
                        rate=0
                    },
                    guarentee=0
                },
                normal={
                    daily=true,
                    bonus={
                        count=0,
                        rate=0
                    },
                    guarentee=0
                }
            },
            party={
                currentParty=1,
                partyList={
                    {
                        {
                            actor=0,
                            equipment={ 0, 0, 0, 0, 0}
                        }
                    }
                }
            },
            mission={
                {}, --daily
                {}, --weekly
                {} --achievement
            },
            cafe={
                list={},
                dispatch={
                    {
                        jobId=0,
                        bonusId=0,
                        party={ 0, 0, 0, 0, 0 },
                        time=0
                    },
                    {
                        jobId=0,
                        bonusId=0,
                        party={ 0, 0, 0, 0, 0 },
                        time=0
                    },
                    {
                        jobId=0,
                        bonusId=0,
                        party={ 0, 0, 0, 0, 0 },
                        time=0
                    },
                    {
                        jobId=0,
                        bonusId=0,
                        party={ 0, 0, 0, 0, 0 },
                        time=0
                    }
                }
            },
            tower={}
        }

        --generate party
        save.party.currentParty = 1
        local partyList = {}
        for i = 1, CONSTANTS.partyCount do
            local members = {}
            for j = 1, CONSTANTS.partyMembersCount do
                members[j] = {
                    actor=0,
                    equipment={ 0, 0, 0, 0, 0 }
                }
            end
            partyList[i] = members
        end
        save.party.partyList = partyList

        --generate missions
        for i = 1, 3 do
            local missions = MAIN.DATA.MISSION.getMissions(i)
            for j = 1, #missions do
                save.mission[i][j] = {
                    count=0,
                    status='Ongoing'
                }
            end
        end

        return false
    else
        return true
    end

end

M.deleteSave = function()
    os.remove(system.pathForFile(CONSTANTS.fileSave, system.DocumentsDirectory))
end

return M