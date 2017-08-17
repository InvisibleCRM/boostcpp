set BOOST_ROOT=E:\boost_1_65_0
set dest_dir=%~dp0
set striped_files=%BOOST_ROOT%\boost_stripped

set module_files=multi_index preprocessor range assign lambda boost/algorithm/string.hpp boost/any.hpp boost/archive/iterators/base64_from_binary.hpp boost/archive/iterators/binary_from_base64.hpp boost/archive/iterators/remove_whitespace.hpp boost/archive/iterators/transform_width.hpp boost/array.hpp boost/bind.hpp boost/cast.hpp boost/config.hpp boost/cstdint.hpp boost/date_time.hpp boost/date_time/gregorian/gregorian.hpp boost/date_time/gregorian/gregorian_types.hpp boost/date_time/posix_time/posix_time.hpp boost/date_time\posix_time\posix_time_io.hpp boost/detail/utf8_codecvt_facet.hpp boost/enable_shared_from_this.hpp boost/filesystem.hpp boost/filesystem/convenience.hpp boost/filesystem/operations.hpp boost/filesystem/path.hpp boost/foreach.hpp boost/format.hpp boost/function.hpp boost/functional/hash.hpp boost/intrusive_ptr.hpp boost/lexical_cast.hpp boost/limits.hpp boost/make_shared.hpp boost/mem_fn.hpp boost/mpl/at.hpp boost/mpl/find.hpp boost/mpl/for_each.hpp boost/mpl/push_front.hpp boost/mpl/remove.hpp boost/mpl/size.hpp boost/mpl/vector.hpp boost/mpl/vector_c.hpp boost/noncopyable.hpp boost/numeric/conversion/cast.hpp boost/optional.hpp boost/program_options.hpp boost/progress.hpp boost/range/algorithm/for_each.hpp boost/ref.hpp boost/scoped_array.hpp boost/scoped_ptr.hpp boost/serialization/singleton.hpp boost/shared_ptr.hpp boost/smart_ptr.hpp boost/smart_ptr/detail/atomic_count.hpp boost/smart_ptr/intrusive_ptr.hpp boost/smart_ptr/make_shared.hpp boost/smart_ptr/shared_ptr.hpp boost/thread/mutex.hpp boost/thread/once.hpp boost/thread/recursive_mutex.hpp boost/thread/thread.hpp boost/thread/xtime.hpp boost/tokenizer.hpp boost/tuple/tuple.hpp boost/tuple/tuple_comparison.hpp boost/type_traits.hpp boost/unordered_map.hpp boost/utility.hpp boost/variant.hpp boost/weak_ptr.hpp boost/xpressive/xpressive.hpp

rem cleanup int dir
rd /S /Q "%striped_files%"
md "%striped_files%"

rem cleanup dest dir (currently we copy into parent dir so cleanup must be done manually)
rem rd /S /Q "%dest_dir%"
rem md "%dest_dir%"

rem buid bcp tool
%BOOST_ROOT%\b2 %BOOST_ROOT%\tools/bcp

rem strip files
%BOOST_ROOT%\dist\bin\bcp --boost=%BOOST_ROOT% %module_files% %striped_files%

rem copy dest dir 
xcopy /Q /S /Y "%striped_files%\boost\*" "%dest_dir%"