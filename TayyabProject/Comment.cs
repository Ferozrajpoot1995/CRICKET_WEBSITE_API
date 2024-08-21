using System;
using System.Collections.Generic;

namespace TayyabProject;

public partial class Comment
{
    public int CommentId { get; set; }

    public int? UserId { get; set; }

    public int? MatchId { get; set; }

    public string? CommentText { get; set; }

    public DateTime? CreatedAt { get; set; }

    public virtual Match? Match { get; set; }
}
