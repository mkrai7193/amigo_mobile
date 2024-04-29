import 'package:get/get.dart';

import '../modules/addMembers/bindings/add_members_binding.dart';
import '../modules/addMembers/views/add_members_view.dart';
import '../modules/addRole/bindings/add_role_binding.dart';
import '../modules/addRole/views/add_role_view.dart';
import '../modules/administration/bindings/administration_binding.dart';
import '../modules/administration/views/administration_view.dart';
import '../modules/callAndVideoCall/bindings/call_and_video_call_binding.dart';
import '../modules/callAndVideoCall/views/call_and_video_call_view.dart';
import '../modules/chatDetail/bindings/chat_detail_binding.dart';
import '../modules/chatDetail/views/chat_detail_view.dart';
import '../modules/chooseGroupName/bindings/choose_group_name_binding.dart';
import '../modules/chooseGroupName/views/choose_group_name_view.dart';
import '../modules/contacts/bindings/contacts_binding.dart';
import '../modules/contacts/views/contacts_view.dart';
import '../modules/groupChat/bindings/group_chat_binding.dart';
import '../modules/groupChat/views/group_chat_view.dart';
import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';
import '../modules/permission/bindings/permission_binding.dart';
import '../modules/permission/views/permission_view.dart';
import '../modules/profile/bindings/profile_binding.dart';
import '../modules/profile/views/profile_view.dart';
import '../modules/register/bindings/register_binding.dart';
import '../modules/register/views/register_view.dart';
import '../modules/selectGroupMembers/bindings/select_group_members_binding.dart';
import '../modules/selectGroupMembers/views/select_group_members_view.dart';
import '../modules/selectGroupType/bindings/select_group_type_binding.dart';
import '../modules/selectGroupType/views/select_group_type_view.dart';
import '../modules/settings/bindings/settings_binding.dart';
import '../modules/settings/views/settings_view.dart';
import '../modules/signInBot/bindings/sign_in_bot_binding.dart';
import '../modules/signInBot/views/sign_in_bot_view.dart';
import '../modules/splash/bindings/splash_binding.dart';
import '../modules/splash/views/splash_view.dart';
import '../modules/startNewMessage/bindings/start_new_message_binding.dart';
import '../modules/startNewMessage/views/start_new_message_view.dart';
import '../modules/uploadFiles/bindings/upload_files_binding.dart';
import '../modules/uploadFiles/views/upload_files_view.dart';
import '../modules/verifyOTP/bindings/verify_o_t_p_binding.dart';
import '../modules/verifyOTP/views/verify_o_t_p_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const initial = Routes.SPLASH;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => const HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.SPLASH,
      page: () => const SplashView(),
      binding: SplashBinding(),
    ),
    GetPage(
      name: _Paths.REGISTER,
      page: () => const RegisterView(),
      binding: RegisterBinding(),
    ),
    GetPage(
      name: _Paths.VERIFY_O_T_P,
      page: () => const VerifyOTPView(),
      binding: VerifyOTPBinding(),
    ),
    GetPage(
      name: _Paths.PROFILE,
      page: () => const ProfileView(),
      binding: ProfileBinding(),
    ),
    GetPage(
      name: _Paths.ADD_ROLE,
      page: () => const AddRoleView(),
      binding: AddRoleBinding(),
    ),
    GetPage(
      name: _Paths.PERMISSION,
      page: () => const PermissionView(),
      binding: PermissionBinding(),
    ),
    GetPage(
      name: _Paths.START_NEW_MESSAGE,
      page: () => const StartNewMessageView(),
      binding: StartNewMessageBinding(),
    ),
    GetPage(
      name: _Paths.CHAT_DETAIL,
      page: () => const ChatDetailView(),
      binding: ChatDetailBinding(),
    ),
    GetPage(
      name: _Paths.SELECT_GROUP_TYPE,
      page: () => const SelectGroupTypeView(),
      binding: SelectGroupTypeBinding(),
    ),
    GetPage(
      name: _Paths.SELECT_GROUP_MEMBERS,
      page: () => const SelectGroupMembersView(),
      binding: SelectGroupMembersBinding(),
    ),
    GetPage(
      name: _Paths.CHOOSE_GROUP_NAME,
      page: () => const ChooseGroupNameView(),
      binding: ChooseGroupNameBinding(),
    ),
    GetPage(
      name: _Paths.GROUP_CHAT,
      page: () => const GroupChatView(),
      binding: GroupChatBinding(),
    ),
    GetPage(
      name: _Paths.ADD_MEMBERS,
      page: () => const AddMembersView(),
      binding: AddMembersBinding(),
    ),
    GetPage(
      name: _Paths.ADMINISTRATION,
      page: () => const AdministrationView(),
      binding: AdministrationBinding(),
    ),
    GetPage(
      name: _Paths.CALL_AND_VIDEO_CALL,
      page: () => const CallAndVideoCallView(),
      binding: CallAndVideoCallBinding(),
    ),
    GetPage(
      name: _Paths.SETTINGS,
      page: () => const SettingsView(),
      binding: SettingsBinding(),
    ),
    GetPage(
      name: _Paths.CONTACTS,
      page: () => const ContactsView(),
      binding: ContactsBinding(),
    ),
    GetPage(
      name: _Paths.UPLOAD_FILES,
      page: () => const UploadFilesView(),
      binding: UploadFilesBinding(),
    ),
    GetPage(
      name: _Paths.SIGN_IN_BOT,
      page: () => const SignInBotView(),
      binding: SignInBotBinding(),
    ),
  ];
}
