commit["2020-06-30T03:32:37Z"]={'meta': {'name': bsdillon, 'message': "Force test to run again"}, ".github/workflows/YmlChangeReport.yml": "@@ -40,7 +40,7 @@ jobs:
           git config --local user.email "action@github.com"
           git config --local user.name "GitHub Action"
           git add ./html/yml_history.js
-          git commit -m "Automatic  update of yml change history" -a
+          git commit -m "Automatic update of yml change history" -a
       # yamllint enable rule:line-length
       - name: Push changes
         uses: ad-m/github-push-action@master"}