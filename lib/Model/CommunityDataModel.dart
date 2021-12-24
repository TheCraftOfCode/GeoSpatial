class CommunityDataModel {
  var resourceType;
  var locationTopLeft;
  var locationTopRight;
  var locationBottomLeft;
  var locationBottomRight;
  var villageCode;

  CommunityDataModel(
      {this.locationBottomLeft,
      this.locationBottomRight,
      this.locationTopLeft,
      this.locationTopRight,
      this.resourceType,
      this.villageCode});

}
