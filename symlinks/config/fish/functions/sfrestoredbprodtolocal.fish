function sfrestoredbprodtolocal --description "[SF] Restore the DB prod in localhost"
    download-prod-db.sh
    import-db-locally.sh prod
end
