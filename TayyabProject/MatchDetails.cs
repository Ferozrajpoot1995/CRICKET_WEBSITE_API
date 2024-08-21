namespace TayyabProject
{
    public partial class MatchDetails
    {
        public int MatchId { get; set; }
        public int? HomeTeamScore { get; set; }
        public int? AwayTeamScore { get; set; }
        public string HomeTeamName { get; set; }
        public string AwayTeamName { get; set; }
        public DateTime MatchDate { get; set; }
        public string Venue { get; set; }
        public string ResultMessage { get; set; }
    }
}
