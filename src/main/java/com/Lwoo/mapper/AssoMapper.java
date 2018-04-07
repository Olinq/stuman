package com.Lwoo.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.Lwoo.pojo.Asso;

public interface AssoMapper extends Mapper<Asso> {
	public List<Asso> getListByCid(int cid);
}
