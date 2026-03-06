import urllib.request
import json
import ssl

ssl._create_default_https_context = ssl._create_unverified_context
url = 'https://api.github.com/repos/Muxd21/moltisdroid/actions/runs?per_page=30'
req = urllib.request.Request(url, headers={'Accept': 'application/vnd.github.v3+json'})
response = urllib.request.urlopen(req)
data = json.loads(response.read().decode())

runs = [r for r in data['workflow_runs'] if 'pages' not in r['name'].lower()]
if not runs:
    print("No non-pages runs found")
    exit()

for run in runs[:5]:
    print(f"\nRun: {run['name']} (ID: {run['id']}, Status: {run['status']}, Conclusion: {run['conclusion']}, Commit: {run['head_sha']})")
    if run['conclusion'] == 'failure' or run['status'] != 'completed':
        jobs_url = run['jobs_url']
        req = urllib.request.Request(jobs_url, headers={'Accept': 'application/vnd.github.v3+json'})
        response = urllib.request.urlopen(req)
        jobs = json.loads(response.read().decode())['jobs']
        for job in jobs:
            if job['conclusion'] == 'failure':
                print(f"  Failed job: {job['name']}")
                # Get the logs url
                print(f"  Check logs at: {job['html_url']}")
