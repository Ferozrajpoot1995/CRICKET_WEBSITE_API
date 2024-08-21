using System;
using System.Collections.Generic;

namespace TayyabProject;

public partial class Player
{
    public int PlayerId { get; set; }

    public string PlayerName { get; set; } = null!;

    public int? TeamId { get; set; }

    public string? Position { get; set; }

    public int? JerseyNumber { get; set; }

    public int? Age { get; set; }

    public string? Nationality { get; set; }

    public DateTime? CreatedAt { get; set; }

    public DateTime? UpdatedAt { get; set; }

    public virtual Team? Team { get; set; }
}
