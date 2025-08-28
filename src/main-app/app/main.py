from starlette.applications import Starlette
from starlette.requests import Request
from starlette.responses import JSONResponse, Response, PlainTextResponse
from starlette.routing import Route
from starlette.templating import Jinja2Templates
from starlette_prometheus import metrics, PrometheusMiddleware
from pathlib import Path
import urllib.request
import uvicorn
import os
import traceback


templates = Jinja2Templates(directory='/code/app/templates')

def fake_proxy_invoke():
    try:
        response = urllib.request.urlopen("http://localhost:9090")
        db_proxy_response = response.read().decode('utf-8')
    except Exception as e:
        print(traceback.format_exc())
        db_proxy_response = "no database proxy found"
    return db_proxy_response

async def root(request):
    nodename = os.getenv('NODE_NAME', 'unknown')
    podname = os.getenv('POD_NAME', 'unknown')
    namespace = os.getenv('NAMESPACE', 'unknown')
    db_proxy_response = fake_proxy_invoke()

    return templates.TemplateResponse('index.html',{
        'request': request,
        'nodename': nodename,
        'namespace': namespace,
        'podname': podname,
        'db_proxy_response': db_proxy_response
    })


async def readyz(request):
    return PlainTextResponse("ok")


routes = [
    Route('/', root),
    Route('/readyz', readyz),
]

app = Starlette(debug=True, routes=routes)

app.add_middleware(PrometheusMiddleware)
app.add_route("/metrics", metrics)

if __name__ == "__main__":
    uvicorn.run(app, host='0.0.0.0', port=8080)