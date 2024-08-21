using System;
using System.Collections.Generic;

namespace TayyabProject;

public partial class Match
{
    public int MatchId { get; set; }

    public int? HomeTeamId { get; set; }

    public int? AwayTeamId { get; set; }

    public DateTime MatchDate { get; set; }

    public string? Venue { get; set; }

    public int? HomeTeamScore { get; set; }

    public int? AwayTeamScore { get; set; }

    public DateTime? CreatedAt { get; set; }

    public DateTime? UpdatedAt { get; set; }

    public virtual Team? AwayTeam { get; set; }

    public virtual ICollection<Comment> Comments { get; set; } = new List<Comment>();

    public virtual Team? HomeTeam { get; set; }
}
