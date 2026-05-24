# Unity mainScene stub improvements

Generated from `unity/mainScene.txt`; `unity/mainScene.md` is used as analysis guidance only.

## Input summary

- Source txt: `unity\mainScene.txt`
- Source md: `unity\mainScene.md`
- `luaScript` entries: 113
- `luaCompareString` entries: 256

## Most frequent calls

- `GameVariables.CheckFlag`: 123
- `coroutine.yield`: 35
- `GameVariables.ForceTakeMoney`: 26
- `GameUtilities.WaitForSecondsYield`: 23
- `UiOverlay.GetCurrentlyOpenedBrowser`: 19
- `BrowserPopup.JoinUsLogin_Enumerator`: 9
- `BrowserPopup.JoinUsOpenBlogLoginPage`: 9
- `UiOverlay.OpenBrowser`: 8
- `BrowserPopup.ChangeWebsite`: 7
- `BrowserPopup.SelectEmail`: 7
- `GameVariables.BotCleanWithRagEffect`: 7
- `GameId.CreateVanilla`: 5
- `NewsDataManager.Force`: 5
- `BotStatusAppPopup.ShowFile`: 4
- `GameVariables.CheckFlagAfterRelative`: 4
- `UiOverlay.GetCurrentlyOpenedBotStatusApp`: 4
- `BotStatusAppPopup.WaitTillPlayerInputNeeded`: 3
- `Flowchart.SetIntegerVariable`: 3
- `GameVariables.ClearMood`: 3
- `ShopManager.GetShop`: 3
- `BotStatusAppPopup.ForceSubmitPlayerInput`: 2
- `GameVariables.RemoveAllEmailsWithId`: 2
- `GameVariables.TryTakeMoney`: 2
- `BotStatusAppPopup.CloseFromUIOverlay`: 1
- `BrowserPopup.CloseFromUIOverlay`: 1
- `BrowserPopup.Refresh`: 1
- `Flowchart.SetBooleanVariable`: 1
- `GameVariables.BotShowerEffect`: 1
- `GameVariables.CheckFlagBeforeRelative`: 1
- `GameVariables.GetFlagSetCount`: 1
- `GameVariables.ReportSleepEnd`: 1
- `GameVariables.TimeInDay`: 1
- `SaveContainer.AddGlobalFlag`: 1
- `SaveContainer.HasGlobalFlag`: 1
- `SaveSingleton.SaveAllChanges`: 1

## Most frequent fields

- `GameVariables.Hour`: 39
- `GameVariables.MentalHealth`: 28
- `GameVariables.money`: 23
- `GameVariables.Satiation`: 21
- `GameVariables.stamina`: 20
- `GameVariables.MaxCum`: 14
- `GameVariables.EverStartedStream`: 10
- `GameVariables.RiotsActive`: 10
- `GameVariables.HalloweenActive`: 8
- `GameVariables.IsBritanniaOnIslandEnding`: 6
- `GameVariables.newsDataManager`: 5
- `GameVariables.RiotsAfter`: 5
- `GameVariables.DayOfTheWeek`: 4
- `GameVariables.lightSwitchOn`: 4
- `GameVariables.search`: 4
- `GameVariables.sympathy`: 4
- `GameVariables.IsLandlordOnIslandEnding`: 3
- `GameVariables.itemManager`: 3
- `GameVariables.Longing`: 3
- `GameUtilities.Save`: 2
- `GameVariables.bathroomLightOn`: 2
- `GameVariables.DispenserLevel`: 2
- `GameVariables.EverCameInBot`: 2
- `GameVariables.EverFuckedBot`: 2
- `GameVariables.HasPointyEars`: 2
- `GameVariables.HasWitchHat`: 2
- `GameVariables.Health`: 2
- `GameVariables.IsAnnalieOnIslandEnding`: 2
- `GameVariables.IsBotSmart`: 2
- `GameVariables.isFisherOnIslandEnding`: 2
- `GameVariables.IsNaked`: 2
- `GameVariables.IsShaniceAndPriestbotOnIslandEnding`: 2
- `GameVariables.IsThereCumOnHer`: 2
- `GameVariables.sus`: 2
- `GameVariables.TimesCameAll`: 2

## Generated legacy aliases

- `MdrgKnownBotStatusFileId`: 2 values from unity/mainScene.txt
- `MdrgKnownGlobalFlagId`: 1 values from unity/mainScene.txt
- `MdrgKnownJoinUsBlogId`: 9 values from unity/mainScene.txt
- `MdrgKnownStoryFlagId`: 69 values from unity/mainScene.txt
- `MdrgKnownWebsiteId`: 35 values from unity/mainScene.txt; browser scripts

## Most frequent story flags

- `riots_beaten_up`: 10
- `Melissa22`: 7
- `Melissa_dead`: 6
- `Annalie_gave_money`: 5
- `ClothierHalloweenWithBot2`: 4
- `church-bigdaddystorylinepart1`: 3
- `church-nun_back1`: 3
- `clothiervisit`: 3
- `good_soul`: 3
- `Karaoke2`: 3
- `Annalie_ending9`: 2
- `artgallery1`: 2
- `basketball_failure`: 2
- `Bathroom1_haggle`: 2
- `BestClient`: 2
- `bigDaddysAdviceFinished`: 2
- `bigDaddysAdvicePart2`: 2
- `church-endJustGoThereGood`: 2
- `church-nun_back7`: 2
- `church-priestbot_lie`: 2
- `GoingOutside3`: 2
- `hobo`: 2
- `hobo_beaten`: 2
- `hobo_failed`: 2
- `ice_skating1`: 2

## Global flags

- `prologueseen`: 2

## Accepted documentation changes

- `class BotStatusAppPopup`
- `class BrowserPopup`
- `class NewsDataManager`
- `field GameUtilities.Save`
- `field GameVariables.newsDataManager`
- `method BotStatusAppPopup.ForceSubmitPlayerInput`
- `method BotStatusAppPopup.ShowFile`
- `method BotStatusAppPopup.WaitTillPlayerInputNeeded`
- `method BrowserPopup.ChangeWebsite`
- `method BrowserPopup.JoinUsLogin_Enumerator`
- `method BrowserPopup.JoinUsOpenBlogLoginPage`
- `method BrowserPopup.SelectEmail`
- `method Flowchart.SetBooleanVariable`
- `method Flowchart.SetIntegerVariable`
- `method GameVariables.BotCleanWithRagEffect`
- `method GameVariables.CheckFlag`
- `method GameVariables.CheckFlagAfterRelative`
- `method GameVariables.CheckFlagBeforeRelative`
- `method GameVariables.ClearMood`
- `method GameVariables.ForceTakeMoney`
- `method GameVariables.GetFlagSetCount`
- `method GameVariables.RemoveAllEmailsWithId`
- `method GameVariables.ReportSleepEnd`
- `method GameVariables.TimeInDay`
- `method GameVariables.TryTakeMoney`
- `method NewsDataManager.Force`
- `method SaveContainer.AddGlobalFlag`
- `method SaveContainer.HasGlobalFlag`
- `method UiOverlay.GetCurrentlyOpenedBotStatusApp`
- `method UiOverlay.GetCurrentlyOpenedBrowser`
- `method UiOverlay.OpenBotStatusApp`
- `method UiOverlay.OpenBotStatusAppPrologue`
- `method UiOverlay.OpenBrowser`

## Rejected documentation candidates

- None

## Accepted type/autocomplete overrides

- `param BotStatusAppPopup.ShowFile.text`
- `param BrowserPopup.ChangeWebsite.address`
- `param BrowserPopup.JoinUsOpenBlogLoginPage.key`
- `param BrowserPopup.JoinUsOpenBlog_Enumerator.key`
- `param GameVariables.CheckFlag.flag`
- `param GameVariables.CheckFlagAfterRelative.flag`
- `param GameVariables.CheckFlagBeforeRelative.flag`
- `param GameVariables.CheckFlagSpecial.flag`
- `param GameVariables.CheckFlagSpecialWithTime.flag`
- `param GameVariables.CheckFlagWithTime.flag`
- `param GameVariables.GetFlagSetCount.flag`
- `param SaveContainer.AddGlobalFlag.flagName`
- `param SaveContainer.HasGlobalFlag.flagName`
- `param SaveContainer.TryGetGlobalFlag.flagName`
- `param UiOverlay.OpenBrowser.website`

## Rejected type/autocomplete overrides

- None

## Validation notes

- Legacy aliases are emitted in `mdrg_legacy_runtime_aliases.d.lua`, separate from regular modding aliases.
- Documentation/type candidates are applied only when the class/member exists in `docs.txt` generated stubs.
- Flag and website aliases keep `|string` fallbacks when used in parameter types.
