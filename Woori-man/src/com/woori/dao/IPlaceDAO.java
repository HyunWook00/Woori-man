package com.woori.dao;

import java.util.ArrayList;

import com.woori.dto.PlaceDTO;

public interface IPlaceDAO
{
	public int insertPlaceAddr1(PlaceDTO dto);
	public int insertPlaceAddr2(PlaceDTO dto);
	public ArrayList<PlaceDTO> getPlaceList(String mt_code);
}
