using Lap1.Models;
using Microsoft.EntityFrameworkCore;

namespace Lap1.Data;

public class SchoolContext : DbContext
{
    public SchoolContext(DbContextOptions<SchoolContext> options) : base(options)
    {
    }
    public virtual DbSet<Course> Courses { get; set; }
    public virtual DbSet<Enrollment> Enrollments { get; set; }
    public virtual DbSet<Learner> Learners { get; set; }
    public virtual DbSet<Major> Majors { get; set; }

    protected override void OnModelCreating(ModelBuilder modelBuilder)
    {
        modelBuilder.Entity<Course>().ToTable(nameof(Course));
        modelBuilder.Entity<Enrollment>().ToTable(nameof(Enrollment));
        modelBuilder.Entity<Learner>().ToTable(nameof(Learner));
        modelBuilder.Entity<Major>().ToTable(nameof(Major));
    }


}