﻿using Base.Models;
using Base.Interfaces;
using BaseApi.Services;
using System.IdentityModel.Tokens.Jwt;
using System.Security.Claims;
using Base.Services;

namespace EarthAdmApi.Services
{
    public class MyBaseUserService : IBaseUserSvc
    {
        //get base user info
        public BaseUserDto GetData()
        {
            var authStr = _Http.GetRequest().Headers["Authorization"]
                .ToString().Replace("Bearer ", "");
            if (authStr == "") return new();

            var token = new JwtSecurityTokenHandler().ReadJwtToken(authStr);
            var userId = token.Claims.First(c => c.Type == ClaimTypes.Name).Value;  //is also session key
            var br = _Cache.GetModel<BaseUserDto>(userId, _Fun.FidBaseUser)!;
            return br;

            /*
            return new BaseUserDto()
            {
                UserId = userId,
            };
            */
        }
    }
}
