class RepoModel
{
  int? id ;
  String? repoName;
  String? repoUrl;
  String? description;
  bool? fork;
  Owner? owner;
  RepoModel.fromJson(Map<String,dynamic> json)
  {
    id = json["id"];
    repoName = json["name"];
    description = json["description"];
    fork = json["fork"];
    repoUrl = json["html_url"];
    owner= Owner.fromJson(json["owner"]);
  }

}
class Owner
{
  String? userName;
  String? ownerGitHub;
  Owner.fromJson(Map<String,dynamic> json)
  {
    userName =json["login"];
    ownerGitHub =json["html_url"];
  }
}