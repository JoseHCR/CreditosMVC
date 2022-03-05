using System;
using System.Collections.Generic;
using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata;

namespace CreditosMVC.Models
{
    public partial class CreditosBancariosContext : DbContext
    {
        public CreditosBancariosContext()
        {
        }

        public CreditosBancariosContext(DbContextOptions<CreditosBancariosContext> options)
            : base(options)
        {
        }

        public virtual DbSet<TbCliente> TbClientes { get; set; } = null!;
        public virtual DbSet<TbCuentasAhorro> TbCuentasAhorros { get; set; } = null!;
        public virtual DbSet<TbHistorialTransaccione> TbHistorialTransacciones { get; set; } = null!;

        protected override void OnConfiguring(DbContextOptionsBuilder optionsBuilder)
        {
            if (!optionsBuilder.IsConfigured)
            {
                optionsBuilder.UseSqlServer("Server=localhost;Database=CreditosBancarios; Trusted_Connection=True;");
            }
        }

        protected override void OnModelCreating(ModelBuilder modelBuilder)
        {
            modelBuilder.Entity<TbCliente>(entity =>
            {
                entity.HasKey(e => e.IdCliente);

                entity.ToTable("tbClientes");

                entity.Property(e => e.Apellidos).HasMaxLength(200);

                entity.Property(e => e.Nombre).HasMaxLength(200);
            });

            modelBuilder.Entity<TbCuentasAhorro>(entity =>
            {
                entity.HasKey(e => e.IdCuentaAhorro);

                entity.ToTable("tbCuentasAhorro");

                entity.Property(e => e.FechaCreacion).HasColumnType("datetime");

                entity.Property(e => e.SaldoActual).HasColumnType("money");

                entity.HasOne(d => d.IdClienteNavigation)
                    .WithMany(p => p.TbCuentasAhorros)
                    .HasForeignKey(d => d.IdCliente)
                    .HasConstraintName("FK_tbCuentasAhorro_tbClientes");
            });

            modelBuilder.Entity<TbHistorialTransaccione>(entity =>
            {
                entity.HasKey(e => e.IdHistorialTransaccion);

                entity.ToTable("tbHistorialTransacciones");

                entity.Property(e => e.Concepto).HasMaxLength(300);

                entity.Property(e => e.FechaTransaccion).HasColumnType("datetime");

                entity.Property(e => e.Monto)
                    .HasColumnType("money")
                    .HasColumnName("monto");

                entity.Property(e => e.SaldoActual).HasColumnType("money");

                entity.Property(e => e.SaldoAnterior).HasColumnType("money");

                entity.HasOne(d => d.IdCuentaAhorroNavigation)
                    .WithMany(p => p.TbHistorialTransacciones)
                    .HasForeignKey(d => d.IdCuentaAhorro)
                    .HasConstraintName("FK_tbHistorialTransacciones_tbCuentasAhorro");
            });

            OnModelCreatingPartial(modelBuilder);
        }

        partial void OnModelCreatingPartial(ModelBuilder modelBuilder);
    }
}
