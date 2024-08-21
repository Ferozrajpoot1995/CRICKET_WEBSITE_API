namespace TayyabProject
{
    public partial class MatchDetailsInformation
    {
        public int MatchID { get; set; }
        public int? HomeTeamScore { get; set; }
        public int? AwayTeamScore { get; set; }
        public string HomeTeamName { get; set; }
        public string AwayTeamName { get; set; }
        public DateTime MatchDate { get; set; }
        public string Venue { get; set; }
        public string HomePlayerName { get; set; }
        public string AwayPlayersName { get; set; }
        public string HomePlayerPosition { get; set; }
        public string AwayPlayersPosition { get; set; }
        public string ResultMessage { get; set; }
    }
}
