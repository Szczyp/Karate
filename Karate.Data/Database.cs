using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.IO;

using NHibernate;
using NHibernate.Cfg;
using NHibernate.Tool.hbm2ddl;

using FluentNHibernate.Cfg;
using FluentNHibernate.Cfg.Db;
using FluentNHibernate.Automapping;

using Karate.Data.Entities;

namespace Karate.Data
{
    public class Database
    {
        Configuration configuration;
        public ISessionFactory SessionFactory { get; private set; }

        //public string DbFile { get; private set; }

        public Database()
        {
            //DbFile = "Karate.db";

            configuration = Fluently.Configure()
              .Database(MsSqlConfiguration.MsSql2008.ConnectionString(s=>s.Server(@"localhost\sqlexpress").Database("Karate").TrustedConnection()))
              .Mappings(m => m.AutoMappings.Add(AutoMap.AssemblyOf<Database>().Where(t=>t.Namespace == "Karate.Data.Entities").IgnoreBase<Entity>()))
              .BuildConfiguration();

            //if (!File.Exists(DbFile))
            //    BuildSchema();

            SessionFactory = configuration.BuildSessionFactory();
        }

        public void BuildSchema()
        {
            //if (File.Exists(DbFile))
            //    File.Delete(DbFile);

            new SchemaExport(configuration)
              .Create(false, true);
        }
    }
}
