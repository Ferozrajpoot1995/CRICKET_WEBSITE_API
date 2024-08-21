using System;
using System.Collections.Generic;

namespace TayyabProject;

public partial class Team
{
    public int TeamId { get; set; }

    public string TeamName { get; set; } = null!;

    public string? City { get; set; }

    public string? CoachName { get; set; }

    public int? FoundedYear { get; set; }

    public DateTime? CreatedAt { get; set; }

    public DateTime? UpdatedAt { get; set; }

    public virtual ICollection<Match> MatchAwayTeams { get; set; } = new List<Match>();

    public virtual ICollection<Match> MatchHomeTeams { get; set; } = new List<Match>();

    public virtual ICollection<Player> Players { get; set; } = new List<Player>();
}
