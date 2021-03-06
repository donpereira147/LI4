﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data.SqlClient;

namespace LoginRegisto
{
    class ProprietarioDAO
    {
        public ProprietarioDAO() { }


        public bool existeProprietario(SqlConnection conn, string e)
        {

            //verificar se existe utilizador com email referido
            SqlParameter email = new SqlParameter("@email", System.Data.SqlDbType.NChar, 40);
            email.Value = e;

            SqlCommand com = new SqlCommand("select count(email) from Proprietario where email=@email", conn);
            com.Parameters.Add(email);


            Int32 count = (Int32)com.ExecuteScalar();

            if (count > 0)
                return true;

            return false;
        }

        //FALTA TESTAR ESTA
        public bool registaProprietario(string n, string e, int t)
        {

            bool exists = false;
            using (SqlConnection conn = new SqlConnection("Trusted_Connection=true;server =NOMORESEGFAULTS\\SQLEXPRESS;database=MnhamMnham"))
            {

                conn.Open();

                exists = existeProprietario(conn, e);

                if (exists == false)
                {
                    //inserir utilizador

                    SqlParameter nome = new SqlParameter("@nome", System.Data.SqlDbType.NChar, 50);
                    nome.Value = n;

                    SqlParameter email1 = new SqlParameter("@email1", System.Data.SqlDbType.NChar);
                    email1.Value = e;

                    SqlParameter tele = new SqlParameter("@tele", System.Data.SqlDbType.Decimal);
                    tele.Precision = 9;
                    tele.Scale = 0;
                    tele.Value = t;

                    SqlCommand registaProprietario = new SqlCommand("INSERT INTO MnhamMnham.dbo.Proprietario ( nome, email, telefone) " +
                                         "Values (@nome, @email1, @tele)", conn);
                    registaProprietario.Parameters.Add(nome);
                    registaProprietario.Parameters.Add(email1);
                    registaProprietario.Parameters.Add(tele);

                    registaProprietario.ExecuteNonQuery();

                }
            }
            return !exists;
        }
    }

}
