using System;
using System.Collections.Generic;
using Microsoft.EntityFrameworkCore;

namespace TayyabProject;

public partial class TayyabProjectContext : DbContext
{
    public TayyabProjectContext()
    {
    }

    public TayyabProjectContext(DbContextOptions<TayyabProjectContext> options)
        : base(options)
    {
    }

    public virtual DbSet<BlogPost> BlogPosts { get; set; }

    public virtual DbSet<Comment> Comments { get; set; }

    public virtual DbSet<Match> Matches { get; set; }

    public virtual DbSet<Player> Players { get; set; }

    public virtual DbSet<Team> Teams { get; set; }

    public virtual DbSet<User> Users { get; set; }

    protected override void OnConfiguring(DbContextOptionsBuilder optionsBuilder)
#warning To protect potentially sensitive information in your connection string, you should move it out of source code. You can avoid scaffolding the connection string by using the Name= syntax to read it from configuration - see https://go.microsoft.com/fwlink/?linkid=2131148. For more guidance on storing connection strings, see https://go.microsoft.com/fwlink/?LinkId=723263.
        => optionsBuilder.UseSqlServer("Server=LAP066PC\\SQLEXPRESS;Database=TayyabProject;User ID=sa;Password=Feroz0312@;TrustServerCertificate=True;");

    protected override void OnModelCreating(ModelBuilder modelBuilder)
    {


        modelBuilder.Entity<BlogPost>(entity =>
        {
            entity.HasKey(e => e.Id).HasName("PK__blog_pos__3213E83F718E8197");

            entity.ToTable("blog_posts");

            entity.Property(e => e.Id).HasColumnName("id");
            entity.Property(e => e.CreatedAt)
                .HasDefaultValueSql("(getdate())")
                .HasColumnType("datetime")
                .HasColumnName("created_at");
            entity.Property(e => e.Description).HasColumnName("description");
            entity.Property(e => e.ImagePath)
                .HasMaxLength(255)
                .HasColumnName("image_path");
            entity.Property(e => e.Title)
                .HasMaxLength(255)
                .HasColumnName("title");
            entity.Property(e => e.UpdatedAt)
                .HasDefaultValueSql("(getdate())")
                .HasColumnType("datetime")
                .HasColumnName("updated_at");
        });

        modelBuilder.Entity<Comment>(entity =>
        {
            entity.HasKey(e => e.CommentId).HasName("PK__Comments__C3B4DFAA5F216CD0");

            entity.Property(e => e.CommentId).HasColumnName("CommentID");
            entity.Property(e => e.CreatedAt)
                .HasDefaultValueSql("(getdate())")
                .HasColumnType("datetime");
            entity.Property(e => e.MatchId).HasColumnName("MatchID");
            entity.Property(e => e.UserId).HasColumnName("UserID");

            entity.HasOne(d => d.Match).WithMany(p => p.Comments)
                .HasForeignKey(d => d.MatchId)
                .HasConstraintName("FK__Comments__MatchI__4E88ABD4");
        });

        modelBuilder.Entity<Match>(entity =>
        {
            entity.HasKey(e => e.MatchId).HasName("PK__Matches__4218C8374D75BB5C");

            entity.HasIndex(e => e.MatchDate, "IDX_Matches_MatchDate");

            entity.Property(e => e.MatchId).HasColumnName("MatchID");
            entity.Property(e => e.AwayTeamId).HasColumnName("AwayTeamID");
            entity.Property(e => e.CreatedAt)
                .HasDefaultValueSql("(getdate())")
                .HasColumnType("datetime");
            entity.Property(e => e.HomeTeamId).HasColumnName("HomeTeamID");
            entity.Property(e => e.MatchDate).HasColumnType("datetime");
            entity.Property(e => e.UpdatedAt)
                .HasDefaultValueSql("(getdate())")
                .HasColumnType("datetime");
            entity.Property(e => e.Venue).HasMaxLength(100);

            entity.HasOne(d => d.AwayTeam).WithMany(p => p.MatchAwayTeams)
                .HasForeignKey(d => d.AwayTeamId)
                .HasConstraintName("FK__Matches__AwayTea__49C3F6B7");

            entity.HasOne(d => d.HomeTeam).WithMany(p => p.MatchHomeTeams)
                .HasForeignKey(d => d.HomeTeamId)
                .HasConstraintName("FK__Matches__HomeTea__48CFD27E");
        });

        modelBuilder.Entity<Player>(entity =>
        {
            entity.HasKey(e => e.PlayerId).HasName("PK__Players__4A4E74A8F281C047");

            entity.HasIndex(e => e.PlayerName, "IDX_Players_PlayerName");

            entity.Property(e => e.PlayerId).HasColumnName("PlayerID");
            entity.Property(e => e.CreatedAt)
                .HasDefaultValueSql("(getdate())")
                .HasColumnType("datetime");
            entity.Property(e => e.Nationality).HasMaxLength(100);
            entity.Property(e => e.PlayerName).HasMaxLength(100);
            entity.Property(e => e.Position).HasMaxLength(50);
            entity.Property(e => e.TeamId).HasColumnName("TeamID");
            entity.Property(e => e.UpdatedAt)
                .HasDefaultValueSql("(getdate())")
                .HasColumnType("datetime");

            entity.HasOne(d => d.Team).WithMany(p => p.Players)
                .HasForeignKey(d => d.TeamId)
                .HasConstraintName("FK__Players__TeamID__440B1D61");
        });

        modelBuilder.Entity<Team>(entity =>
        {
            entity.HasKey(e => e.TeamId).HasName("PK__Teams__123AE7B932FCC045");

            entity.HasIndex(e => e.TeamName, "IDX_Teams_TeamName");

            entity.HasIndex(e => e.TeamName, "UQ__Teams__4E21CAAC60890D8D").IsUnique();

            entity.Property(e => e.TeamId).HasColumnName("TeamID");
            entity.Property(e => e.City).HasMaxLength(100);
            entity.Property(e => e.CoachName).HasMaxLength(100);
            entity.Property(e => e.CreatedAt)
                .HasDefaultValueSql("(getdate())")
                .HasColumnType("datetime");
            entity.Property(e => e.TeamName).HasMaxLength(100);
            entity.Property(e => e.UpdatedAt)
                .HasDefaultValueSql("(getdate())")
                .HasColumnType("datetime");
        });

        modelBuilder.Entity<User>(entity =>
        {
            entity.HasKey(e => e.UserId).HasName("PK__Users__1788CCAC10C7A6A1");

            entity.HasIndex(e => e.Username, "UQ__Users__536C85E46796AD66").IsUnique();

            entity.HasIndex(e => e.Email, "UQ__Users__A9D10534A8ACAF82").IsUnique();

            entity.Property(e => e.UserId).HasColumnName("UserID");
            entity.Property(e => e.CreatedAt)
                .HasDefaultValueSql("(getdate())")
                .HasColumnType("datetime");
            entity.Property(e => e.Email).HasMaxLength(100);
            entity.Property(e => e.FullName).HasMaxLength(100);
            entity.Property(e => e.PasswordHash).HasMaxLength(256);
            entity.Property(e => e.UpdatedAt)
                .HasDefaultValueSql("(getdate())")
                .HasColumnType("datetime");
            entity.Property(e => e.Username).HasMaxLength(50);
        });

        OnModelCreatingPartial(modelBuilder);
    }

    partial void OnModelCreatingPartial(ModelBuilder modelBuilder);
}
