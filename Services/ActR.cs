﻿using Base.Enums;
using Base.Models;
using Base.Services;
using Newtonsoft.Json.Linq;

namespace EarthAdmApi.Services
{
    public class ActR
    {
        private readonly ReadDto dto = new()
        {
            ReadSql = @"
select a.*, CreatorName=u.Name
from dbo.Act a
join dbo.[User] u on a.Creator=u.Id
order by a.Id
",
            TableAs = "a",
            Items = new QitemDto[] {
                new() { Fid = "Name", Op = ItemOpEstr.Like },
                new() { Fid = "AuditStatus" },
            },
        };

        public async Task<JObject?> GetPageA(string ctrl, EasyDtDto dt)
        {
            return await new CrudReadSvc().GetPageA(dto, dt, ctrl);
        }

    } //class
}