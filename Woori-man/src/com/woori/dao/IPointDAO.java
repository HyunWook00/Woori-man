package com.woori.dao;

import com.woori.dto.PointDTO;

public interface IPointDAO
{
	public int insertPoint(PointDTO dto);	// 포인트 획득
	public int cancelPoint(PointDTO dto);	// 포인트 획득 취소
}
