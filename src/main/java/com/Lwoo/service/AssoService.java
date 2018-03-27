package com.Lwoo.service;

import java.util.List;

import com.Lwoo.pojo.Asso;

public interface AssoService extends BaseService<Asso> {
	public List<Asso> getListByCid(int cid);
}
