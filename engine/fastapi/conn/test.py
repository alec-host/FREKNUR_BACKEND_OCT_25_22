import asyncio

from redis_wrapper import RedisCache

redis_wrapper = RedisCache()


async def write():
   ans =  await redis_wrapper._set("MSG","hello world")

async def ms():
    msg = await redis_wrapper._get("MSG")

#print(write())


if __name__ == "__main__":
    #asyncio.set_event_loop(asyncio.ProactorEventLoop())
    '''
    loop = asyncio.get_event_loop()
    loop.run_until_complete(redis_wrapper.init_redis_cache())
    loop.close()
    '''
    loop = asyncio.get_event_loop()
    loop.run_until_complete(redis_wrapper._set("MSG","ddddddddddddddddddddddd"))
    loop.close()    

    #redis_wrapper._set("MSG","ddddddddddddddddddddddd")
    #asyncio.run(redis_wrapper.init_redis_cache())
    #asyncio.run(write())

