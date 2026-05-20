import streamlit as st
import pandas as pd
import numpy as np

st.set_page_config(
    page_title="Mon Dashboard",
    page_icon="📊",
    layout="wide"
)

st.title("📊 Mon Dashboard de Test")
st.markdown("---")

# Métriques
col1, col2, col3 = st.columns(3)
col1.metric("Utilisateurs", "1 234", "+12%")
col2.metric("Revenus", "5 678 €", "+8%")
col3.metric("Satisfaction", "94%", "+2%")

st.markdown("---")

# Graphique simple avec données aléatoires
st.subheader("📈 Évolution des ventes")
data = pd.DataFrame(
    np.random.randn(30, 3).cumsum(axis=0),
    columns=["Produit A", "Produit B", "Produit C"]
)
st.line_chart(data)

# Tableau de données
st.subheader("📋 Données brutes")
st.dataframe(data.tail(10), use_container_width=True)

st.markdown("---")
st.caption("✅ Stack opérationnelle : Streamlit + Docker")