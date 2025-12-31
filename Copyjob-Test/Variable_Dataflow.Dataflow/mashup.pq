[StagingDefinition = [Kind = "FastCopy"]]
section Section1;
[DataDestinations = {[Definition = [Kind = "Reference", QueryName = "holidaydatacontainer_DataDestination", IsNewTarget = true], Settings = [Kind = "Manual", AllowCreation = true, ColumnSettings = [Mappings = {[SourceColumnName = "countryOrRegion", DestinationColumnName = "countryOrRegion"], [SourceColumnName = "holidayName", DestinationColumnName = "holidayName"], [SourceColumnName = "normalizeHolidayName", DestinationColumnName = "normalizeHolidayName"], [SourceColumnName = "isPaidTimeOff", DestinationColumnName = "isPaidTimeOff"], [SourceColumnName = "countryRegionCode", DestinationColumnName = "countryRegionCode"], [SourceColumnName = "date", DestinationColumnName = "date"]}], DynamicSchema = false, UpdateMethod = [Kind = "Replace"], TypeSettings = [Kind = "Table"]]]}]
shared holidaydatacontainer = let
  Source = Lakehouse.Contents(null),
  Navigation = Source{[workspaceId = WorkspaceId]}[Data],
  #"Navigation 1" = Navigation{[lakehouseId = LakehouseID]}[Data],
  #"Navigation 2" = #"Navigation 1"{[Id = "holidaydatacontainer", ItemKind = "Table"]}[Data],
  #"Filtered rows" = Table.SelectRows(#"Navigation 2", each [countryOrRegion] = Region)
in
  #"Filtered rows";
shared WorkspaceId = let
  WorkspaceId = Variable.ValueOrDefault("$(/**/dataflow-Variables/WorkspaceId)", "7d80a729-a465-4561-bf89-4e6f75c88220")
in
WorkspaceId;
shared LakehouseID = let
  LakehouseID = Variable.ValueOrDefault("$(/**/dataflow-Variables/LakehouseID)", "c0dc0464-03cb-4d73-9fae-92518b20d8d6")
in
LakehouseID;
shared Region = let
  Source = Variable.ValueOrDefault("$(/**/dataflow-Variables/Region)", "Sweden")
in
  Source;
shared holidaydatacontainer_DataDestination = let
  Pattern = Fabric.Warehouse([HierarchicalNavigation = null, CreateNavigationProperties = false]),
  Navigation_1 = Pattern{[workspaceId = "7d80a729-a465-4561-bf89-4e6f75c88220"]}[Data],
  Navigation_2 = Navigation_1{[warehouseId = "82a4a58a-56bc-4f85-be8e-1b296372fa47"]}[Data],
  TableNavigation = Navigation_2{[Item = "holidaydatacontainer", Schema = "dbo"]}?[Data]?
in
  TableNavigation;
