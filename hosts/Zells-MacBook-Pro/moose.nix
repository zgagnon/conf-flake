{user, homeDirectory, ...}:
let
in {
home-manager.users.${user}.home.file = {
"${homeDirectory}/message.txt".text = "sup losers especially ${user}";
};
}
