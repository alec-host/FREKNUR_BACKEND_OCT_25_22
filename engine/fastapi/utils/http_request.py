
import aiohttp

_url = "http://localhost:8000/recordUserActivity/"

async def _post(data: any,url=_url):
    async with aiohttp.ClientSession() as aio_session:
        async with aio_session.post(url,json=data) as resp:
            await aio_session.close()

            return resp.text()
