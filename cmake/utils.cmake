#/*******************************************************************************
#
# \file    utils.cmake
# \brief   cmake���빫������ģ��
# \author  Winter
# \version 1.0
# \date    2021-11-20
#
# -----------------------------------------------------------------------------
#
# -----------------------------------------------------------------------------
# �ļ��޸���ʷ��
# <ʱ��>        |  <�汾>  | <����>        |
# 2021-11-20    |  v1.0    | Winter       |
# -----------------------------------------------------------------------------
# ******************************************************************************/

# @breif: ��õ�ǰĿ¼����Ŀ¼�����б�
# @param[in]: result -> �����б�
# @param[in]: curdir -> ��ǰ�б�
macro(subDirList result curdir)
  FILE(GLOB children RELATIVE ${curdir} ${curdir}/*)
  SET(dirlist "")
  foreach (child ${children})
    if (IS_DIRECTORY ${curdir}/${child} AND NOT ${child} STREQUAL "CMakeFiles")
      list(APPEND dirlist ${child})
    endif()
  endforeach ()
  set(${result} ${dirlist})
endmacro()

# @breif: �ļ�������֯
# @param[in]: moduleFiles -> ����ָ���ļ�����ָ����ʽ�ļ���ɵ��б�
# @param[in]: groupDir -> ������Ŀ¼·��
# @param[in]: groupName -> ������
# @param[in]: fileFormat -> ָ���ļ���ʽ
macro(fileGroup moduleFiles groupDir groupName fileFormat)
    # ��ô�����Ŀ¼������ָ����ʽ�ļ�·��
    file(GLOB_RECURSE MODULE_FILES "${groupDir}/*.${fileFormat}")
    foreach(FILE ${MODULE_FILES})       
        # ����ļ�����Ŀ¼
        get_filename_component(LOC_DIR ${FILE} DIRECTORY)          
        # �Ƴ�ǰ׺
        string(REPLACE ${groupDir} "" GROUP ${LOC_DIR})
        set(GROUP ${groupName}${GROUP})      
        source_group(${GROUP} FILES ${FILE})
    endforeach()
    set(${moduleFiles} ${MODULE_FILES})
endmacro()