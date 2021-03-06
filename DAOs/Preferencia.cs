﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace LoginRegisto
{
    class Preferencia
    {
        HashSet<String> preferencias;
        HashSet<String> naoPreferencias;

        PreferenciaDAO pDAO;

        public Preferencia()
        {
            pDAO = new PreferenciaDAO();
            preferencias = new HashSet<string>();
            naoPreferencias = new HashSet<string>();
        }

        public HashSet<String> getPreferencias(int idU)
        {
            HashSet<String> pr = pDAO.getPreferencias(idU, true);

            for (int i = 0; i < pr.Count(); i++)
            {
                preferencias.Add(pr.ElementAt(i));
            }

            return preferencias;
        }

        public HashSet<String> getNaoPreferencias(int idU)
        {
            HashSet<String> pr = pDAO.getPreferencias(idU, false);

            for (int i = 0; i < pr.Count(); i++)
            {
                naoPreferencias.Add(pr.ElementAt(i));
            }

            return naoPreferencias;
        }


        public void registaPreferenciaPontual(string preferencia)
        {
            preferencias.Add(preferencia);
        }

        public void registaNaoPreferenciaPontual(string naoPreferencia)
        {
            preferencias.Add(naoPreferencia);
        }

        public void removePreferenciaPontual(string preferencia)
        {
            preferencias.Remove(preferencia);
        }

        public void removeNaoPreferenciaPontual(string naoPreferencia)
        {
            preferencias.Remove(naoPreferencia);
        }


        public void registaPreferencia(int idU, string ingrediente, string tipo_cozinha)
        {
            if (ingrediente.CompareTo("") != 0)
                registaPreferenciaPontual(ingrediente);
            else if (tipo_cozinha.CompareTo("") != 0)
                registaPreferenciaPontual(tipo_cozinha);

            adicionaPreferencia(idU, true, ingrediente, tipo_cozinha);
        }

        public void registaNaoPreferencia(int idU, string ingrediente, string tipo_cozinha)
        {
            if (ingrediente.CompareTo("") != 0)
                registaNaoPreferenciaPontual(ingrediente);
            else if (tipo_cozinha.CompareTo("") != 0)
                registaNaoPreferenciaPontual(tipo_cozinha);

            adicionaPreferencia(idU, false, ingrediente, tipo_cozinha);
        }

        private void adicionaPreferencia(int idU, bool tipo, string ingrediente, string tipo_cozinha)
        {
            int idPreferencia = pDAO.existePreferencia(tipo, ingrediente, tipo_cozinha);
            pDAO.registaPreferencia(idU, idPreferencia, tipo, ingrediente, tipo_cozinha);
        }



        public bool removePreferencia(int idU, string preferencia)
        {
            preferencias.Remove(preferencia);
            return eliminaPreferencia(idU, preferencia, true);
        }

        public bool removeNaoPreferencia(int idU, string preferencia)
        {
            naoPreferencias.Remove(preferencia);
            return eliminaPreferencia(idU, preferencia, false);
        }

        private bool eliminaPreferencia(int idU, string preferencia, bool tipo)
        {
            return pDAO.eliminaPreferencia(idU, preferencia, tipo);
        }

    }
}
