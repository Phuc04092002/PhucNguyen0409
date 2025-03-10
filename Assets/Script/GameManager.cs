using System.Collections;
using System.Collections.Generic;
using TMPro;
using UnityEngine;
using UnityEngine.UI;
using DG.Tweening;
using UnityEngine.SceneManagement;
using Unity.VisualScripting;


public static class PlayerPrefsExtensions
{
    // Phương thức để lưu giá trị boolean
    public static void SetBool(string key, bool value)
    {
        PlayerPrefs.SetInt(key, value ? 1 : 0);
    }

    // Phương thức để lấy giá trị boolean
    public static bool GetBool(string key, bool defaultValue = false)
    {
        return PlayerPrefs.GetInt(key, defaultValue ? 1 : 0) == 1;
    }
}
public class GameManager : MonoBehaviour
{
    private Animator AYSanimator, SuccessPopUpanimator, YALanimator, SettingsAnimator, OOLAnimator, NoAdsAnimator, ShopAnimator, BoosterAnimator, BuyHammerBoosterAnim, BuyHoleBoosterAnim, BuyBoxBoosterAnim;
    public bool FullBox = false, BoxBoosted = false, CheckHoleCount = false, SetVibration = true, SetOneHourInfinite = false, SetThreeHourInfinite = false, SetSixHourInfinite = false;
    public Transform Indicator;
    private bool SCPopUp = false, OOLPopUp = false;
    public bool KP = false, HammerBooster = false, HoleBooster = false, ClickedKP = false, BoxBooster = false;
    public float Heart, Gold, remainingTime, HammerBoosterIndex = 10, HoleBoosterIndex = 10, BoxBoosterIndex = 10;
    public TextMeshProUGUI HeartText, timerText, timerText2, ADXGoldText, GoldText, HammerBoosterText, HoleBoosterText, BoxBoosterText;
    public GameObject mainScreenUI, KeepPlayingUI, SuccessUI, OOLUI, SettingsUI, RestartUI, LossUI, NoAdsUI, ShopUI, BoosterUI, BuyHammerBoosterUI, BuyHoleBoosterUI, BuyBoxBoosterUI;
    public GameObject HammerPlus, HolePlus, BoxPlus, HammerCount, HoleCount, BoxCount, InfinitySymbol, TapAudio;
    public static GameManager instance;
    public Slider FeatureBar;
    public float FillSpeed = 0.5f, rotationAngle = 70f, RotationZNow;
    private float time, OneRemainingTime = 10, ThreeRemainingTime = 20, SixRemainingTime = 30;
    public AudioSource TapAudioSource;
    [SerializeField] private float targetProgress = 0f;
    private void Awake()
    {
        if (instance == null)
        {
            instance = this;
        }
        else
        {
            Destroy(gameObject);
        }
    }
    void Start()
    {
        Application.targetFrameRate = 120;
        MoveIndicator();
        BuyBoxBoosterAnim = BuyBoxBoosterUI.GetComponent<Animator>();
        BuyHoleBoosterAnim = BuyHoleBoosterUI.GetComponent<Animator>();
        BuyHammerBoosterAnim = BuyHammerBoosterUI.GetComponent<Animator>();
        BoosterAnimator = BoosterUI.GetComponent<Animator>();
        ShopAnimator = ShopUI.GetComponent<Animator>();
        NoAdsAnimator = NoAdsUI.GetComponent<Animator>();
        OOLAnimator = OOLUI.GetComponent<Animator>();
        SettingsAnimator = SettingsUI.GetComponent<Animator>();
        AYSanimator = RestartUI.GetComponent<Animator>();
        YALanimator = LossUI.GetComponent<Animator>();
        SuccessPopUpanimator = SuccessUI.GetComponent<Animator>();
        ShowGameScene();
        Heart = PlayerPrefs.GetFloat("HeartPoint");
        remainingTime = PlayerPrefs.GetFloat("CDTime");
        Gold = PlayerPrefs.GetFloat("GoldElement");
        targetProgress = PlayerPrefs.GetFloat("FeatureElement");
        HammerBoosterIndex = PlayerPrefs.GetFloat("HammerBoosterElement");
        HoleBoosterIndex = PlayerPrefs.GetFloat("HoleBoosterElement");
        BoxBoosterIndex = PlayerPrefs.GetFloat("BoxBoosterElement");
        OneRemainingTime = PlayerPrefs.GetFloat("1CDTime");
        ThreeRemainingTime = PlayerPrefs.GetFloat("3CDTime");
        SixRemainingTime = PlayerPrefs.GetFloat("6CDTime");
        SetOneHourInfinite = PlayerPrefsExtensions.GetBool("1hInfinite");
        SetThreeHourInfinite = PlayerPrefsExtensions.GetBool("3hInfinite");
        SetSixHourInfinite = PlayerPrefsExtensions.GetBool("6hInfinite");
        TapAudioSource = TapAudio.GetComponent<AudioSource>();
    }

    public void ShowGameScene()
    {
        mainScreenUI.SetActive(true);
    }
    // Success UI
    public void OnSuccessPopUp()
    {
        SuccessUI.SetActive(true);
        SCPopUp = true;

        SetFeaturevalue(0.05f);
    }
    public void OffSuccessPopUp()
    {
        SuccessUI.SetActive(false);
        SCPopUp = false;
    }
    public void SetFeaturevalue(float value)
    {
        targetProgress += value;
        SaveData();
    }
    public void GoldUp()
    {
        Gold = Gold + 10;
        LoadNextLevel();
        SaveData();
    }
    public void GoldxUp()
    {
        if (40f < RotationZNow && RotationZNow < 47f)
        {
            Gold += 15;
            LoadNextLevel();
        }
        else if (313f < RotationZNow && RotationZNow < 322f)
        {
            Gold += 15;
            LoadNextLevel();
        }
        else if (22f < RotationZNow && RotationZNow < 40f)
        {
            Gold += 20;
            LoadNextLevel();
        }
        else if (322f < RotationZNow && RotationZNow < 340f)
        {
            Gold += 20;
            LoadNextLevel();
        }
        else if (7f < RotationZNow && RotationZNow < 22f)
        {
            Gold += 25;
            LoadNextLevel();
        }
        else if (340f < RotationZNow && RotationZNow < 353f)
        {
            Gold += 25;
            LoadNextLevel();
        }
        else if (353f < RotationZNow && RotationZNow < 360f)
        {
            Gold += 30;
            LoadNextLevel();
        }
        else if (0f < RotationZNow && RotationZNow < 7f)
        {
            Gold += 30;
            LoadNextLevel();
        }
        SaveData();
    }
    public void XGold()
    {
        if (40f < RotationZNow && RotationZNow < 47f)
        {
            ADXGoldText.text = "15";
        }
        else if (313f < RotationZNow && RotationZNow < 322f)
        {
            ADXGoldText.text = "15";
        }
        else if (22f < RotationZNow && RotationZNow < 40f)
        {
            ADXGoldText.text = "20";
        }
        else if (322f < RotationZNow && RotationZNow < 340f)
        {
            ADXGoldText.text = "20";
        }
        else if (7f < RotationZNow && RotationZNow < 22f)
        {
            ADXGoldText.text = "25";
        }
        else if (340f < RotationZNow && RotationZNow < 353f)
        {
            ADXGoldText.text = "25";
        }
        else if (353f < RotationZNow && RotationZNow < 360f)
        {
            ADXGoldText.text = "30";
        }
        else if (0f < RotationZNow && RotationZNow < 7f)
        {
            ADXGoldText.text = "30";
        }
    }
    public void MoveIndicator()
    {
        float currentRotation = -47;
        float targetRotation = currentRotation + rotationAngle;
        Tween rotationTween = Indicator.DORotate(new Vector3(0, 0, targetRotation), 0.7f);
        rotationTween.SetEase(Ease.Linear);
        rotationTween.SetLoops(-1, LoopType.Yoyo);
    }
    // Keep Playing UI
    public void OnKeepPlayingPopUp()
    {
        KeepPlayingUI.SetActive(true);
    }
    public void OffKeepPlayingPopUp()
    {
        KeepPlayingUI.SetActive(false);
    }
    public void PayGoldHeartUp()
    {
        if (Gold >= 250)
        {
            if (Heart < 5)
            {
                Heart += 1;
            }
            else
            {
                Heart = 5;
            }
        }
        else
        {
            OnShop();
        }
        SaveData();
    }
    public void GiveUpButton()
    {
        if (SetOneHourInfinite == false && SetThreeHourInfinite == false && SetSixHourInfinite == false)
        {
            if (Heart >= 1 && Heart <= 5)
            {

                OffKeepPlayingPopUp();
                OffRestartPopUp();
                OffYALPopUp();
                Invoke("ReloadScene", 1f);
                Invoke ("HeartDown", 1f);
            }
            else if (Heart <= 0)
            {
                OffKeepPlayingPopUp();
                OffRestartPopUp();
                OffYALPopUp();
                OnOOL();
            }
        }
        else
        {
            OffKeepPlayingPopUp();
            OffRestartPopUp();
            OffYALPopUp();
            Invoke("ReloadScene", 1f);
        }
    }
    public void KeepPlayingButton()
    {
        if (Gold >= 250)
        {
            KP = true;
            ClickedKP = true;
            OffKeepPlayingPopUp();
        }
        else
        {
            KP = false;
            OnShop();
        }
    }
    // Out Of Live UI
    public void OnOOL()
    {
        OOLAnimator.SetBool("CloseOOL", true);
        OOLUI.SetActive(true);
        OOLPopUp = true;
    }
    public void OffOOL()
    {
        OOLAnimator.SetBool("CloseOOL", false);
        Invoke("CloseOOL", 1f);
        if (Heart <= 0)
        {
            Invoke("Quit", 1f);
        }
    }
    public void CloseOOL()
    {
        OOLUI.SetActive(false);
    }
    // Settings UI
    public void OnSettings()
    {
        SettingsAnimator.SetBool("Close", true);
        SettingsUI.SetActive(true);
    }
    public void OffSettings()
    {
        StartCoroutine(CloseSettingsPopUp());
    }
    IEnumerator CloseSettingsPopUp()
    {
        SettingsAnimator.SetBool("Close", false);
        yield return new WaitForSeconds(1f);
        SettingsUI.SetActive(false);
    }
    // Restart UI
    public void OnRestartPopUp()
    {
        AYSanimator.SetBool("Active", true);
        RestartUI.SetActive(true);
    }
    public void OffRestartPopUp()
    {
        StartCoroutine(CloseAnimAYSPopUp());
    }
    // You Are Loss UI
    public void OnYALPopUp()
    {
        YALanimator.SetBool("YALActive", true);
        LossUI.SetActive(true);
    }
    public void OffYALPopUp()
    {
        StartCoroutine(CloseAnimYALPopUp());
    }
    IEnumerator CloseAnimAYSPopUp()
    {
        AYSanimator.SetBool("Active", false);
        yield return new WaitForSeconds(0.5f);
        RestartUI.SetActive(false);
    }
    IEnumerator CloseAnimYALPopUp()
    {
        YALanimator.SetBool("YALActive", false);
        yield return new WaitForSeconds(0.5f);
        LossUI.SetActive(false);
    }
    // No Ads UI
    public void OnNoAdsPopUp()
    {
        NoAdsUI.SetActive(true);
    }
    public void OffNoAdsPopUp()
    {
        NoAdsAnimator.SetTrigger("Click");
        Invoke("CloseNoAdsPopUp", 1.1f);
    }
    public void CloseNoAdsPopUp()
    {
        NoAdsUI.SetActive(false);
    }
    // Shop UI
    public void OnShop()
    {
        ShopUI.SetActive(true);
        Invoke("SetAnimatorShop", 0.8f);
    }
    public void OffShop()
    {
        ShopUI.GetComponent<Animator>().enabled = true;
        ShopAnimator.SetBool("CloseShop", false);
        Invoke("CloseShopUI", 0.8f);
    }
    public void CloseShopUI()
    {
        ShopUI.SetActive(false);
    }
    public void SetAnimatorShop()
    {
        ShopUI.GetComponent<Animator>().enabled = false;
    }
    public void NoAdsBundle()
    {
        Gold += 555;
        HammerBoosterIndex += 5;
        HoleBoosterIndex += 5;
        BoxBoosterIndex += 5;
        SaveData();
    }
    public void CoinPack1()
    {
        Gold += 250;
        SaveData();
    }
    public void CoinPack2()
    {
        Gold += 750;
        SaveData();
    }
    public void CoinPack3()
    {
        Gold += 1600;
        SaveData();
    }
    public void CoinPack4()
    {
        Gold += 5000;
        SaveData();
    }
    public void CoinPack5()
    {
        Gold += 12500;
        SaveData();
    }
    public void CoinPack6()
    {
        Gold += 30000;
        SaveData();
    }
    public void OneHourInfiniteBundle()
    {
        Gold += 1500;
        SetOneHourInfinite = true;
        SaveData();
    }
    public void ThreeHourInfiniteBundle()
    {
        Gold += 2500;
        HammerBoosterIndex += 5;
        HoleBoosterIndex += 5;
        BoxBoosterIndex += 5;
        SetThreeHourInfinite = true;
        SaveData();
    }
    public void SixHourInfiniteBundle()
    {
        Gold += 4000;
        HammerBoosterIndex += 10;
        HoleBoosterIndex += 10;
        BoxBoosterIndex += 10;
        SetSixHourInfinite = true;
        SaveData();
    }
    // Game Screen UI
    public void HeartUp()
    {
        if (Heart < 5)
        {
            Heart += 1;
        }
        else
        {
            Heart = 5;
        }
        SaveData();
    }

    public void HeartDown()
    {
        Heart = Heart - 1;
        SaveData();
    }

    public void GoldDown()
    {
        if (Gold >= 250)
        {
            Gold -= 250;
        }
        else { }
        SaveData();
    }

    //Hammer Booster
    public void OnHammerBooster()
    {
        BoosterAnimator.SetBool("Open", true);
    }
    public void OffHammerBooster()
    {
        BoosterAnimator.SetBool("Open", false);
        HammerBooster = false;
    }
    public void HammerBDown()
    {
        if (HammerBoosterIndex > 0)
        {
            HammerBoosterIndex -= 1;
            SaveData();
        }
    }
    public void BuyHammerBoosterButton()
    {
        if (Gold >= 345)
        {
            Gold -= 345;
            HammerBoosterIndex += 3;
            SaveData();
        }
        else
        {
            OnShop();
        }
        BuyHammerBoosterAnim.SetBool("Close", false);
        Invoke("CloseBuyHammerBooster", 1f);
    }
    public void CloseShopHammerBoosterButton()
    {
        BuyHammerBoosterAnim.SetBool("Close", false);
        Invoke("CloseBuyHammerBooster", 1f);
    }
    public void CloseBuyHammerBooster()
    {
        BuyHammerBoosterUI.SetActive(false);
    }
    public void HammerBoosterButton()
    {
            if (HammerBoosterIndex >= 1)
            {
                HammerBooster = true;
            }
            else
            {
                BuyHammerBoosterUI.SetActive(true);
                BuyHammerBoosterAnim.SetBool("Close", true);
            }
    }
    // Hole Booster 
    public void BuyHoleBoosterButton()
    {
        if (Gold >= 225)
        {
            Gold -= 225;
            HoleBoosterIndex += 3;
            SaveData();
        }
        else
        {
            OnShop();
        }
        BuyHoleBoosterAnim.SetBool("Close", false);
        Invoke("CloseBuyHoleBooster", 1f);
    }
    public void CloseShopHoleBoosterButton()
    {
        BuyHoleBoosterAnim.SetBool("Close", false);
        Invoke("CloseBuyHoleBooster", 1f);
    }
    public void CloseBuyHoleBooster()
    {
        BuyHoleBoosterUI.SetActive(false);
    }
    public void HoleBoosterButton()
    {
        if (HoleBoosterIndex >= 1)
        {
            HoleBooster = true;
        }
        else
        {
            BuyHoleBoosterUI.SetActive(true);
            BuyHoleBoosterAnim.SetBool("Close", true);
        }
    }

    public void HoleBDown()
    {
        if (CheckHoleCount == false)
        {
            if (HoleBoosterIndex > 0)
            {
                HoleBoosterIndex -= 1;
                SaveData();
            }
        }
    }
    // Toolbox Booster
    public void BuyBoxBoosterButton()
    {
        if (Gold >= 285)
        {
            Gold -= 285;
            BoxBoosterIndex += 3;
            SaveData();
        }
        else
        {
            OnShop();
        }
        BuyBoxBoosterAnim.SetBool("Close", false);
        Invoke("CloseBuyBoxBooster", 1f);
    }
    public void CloseShopBoxBoosterButton()
    {
        BuyBoxBoosterAnim.SetBool("Close", false);
        Invoke("CloseBuyBoxBooster", 1f);
    }
    public void CloseBuyBoxBooster()
    {
        BuyBoxBoosterUI.SetActive(false);
    }
    public void BoxBDown()
    {
        if (BoxBoosterIndex > 0)
        {
            BoxBoosterIndex -= 1;
            SaveData();
        }
    }
    public void BoxBoosterButton()
    {
        if (BoxBoosted == false)
        {
            if (BoxBoosterIndex >= 1)
            {
                BoxBooster = true;
            }
            else
            {
                BuyBoxBoosterUI.SetActive(true);
                BuyBoxBoosterAnim.SetBool("Close", true);
            }
        }
    }
    // Rung
    public void Vibrate()
    {
        Handheld.Vibrate();
    }
    // Update
    public void Update()
    {
        ShopAnimator = ShopUI.GetComponent<Animator>();
        GoldText.text = Gold.ToString();
        HeartText.text = Heart.ToString();
        HammerBoosterText.text = HammerBoosterIndex.ToString();
        HoleBoosterText.text = HoleBoosterIndex.ToString();
        BoxBoosterText.text = BoxBoosterIndex.ToString();
        RotationZNow = Indicator.eulerAngles.z;
        XGold();
        if (SetOneHourInfinite == false && SetThreeHourInfinite == false && SetSixHourInfinite == false)
        {
            HeartText.gameObject.SetActive(true);
            InfinitySymbol.SetActive(false);
            if (GameManager.instance.Heart < 5)
            {
                // Đếm ngược time
                if (remainingTime > 0)
                {
                    remainingTime -= Time.unscaledDeltaTime;
                }
                else if (remainingTime <= 0)
                {

                    remainingTime = 30;

                    GameManager.instance.HeartUp();
                }
                int minutes = Mathf.FloorToInt(remainingTime / 60);
                int seconds = Mathf.FloorToInt(remainingTime % 60);
                timerText.text = string.Format("{0:00}:{1:00}", minutes, seconds);
                timerText2.text = string.Format("{0:00}:{1:00}", minutes, seconds);
            }
            else
            {
                timerText.text = "Max";
            }
        }
        else if(SetOneHourInfinite == true && SetThreeHourInfinite == false && SetSixHourInfinite == false )
        {
            HeartText.gameObject.SetActive(false);
            InfinitySymbol.SetActive(true);
            if (OneRemainingTime > 0)
            {
                OneRemainingTime -= Time.unscaledDeltaTime;
                SaveData();
            }
            else
            {
                SetOneHourInfinite = false;
                OneRemainingTime = 10;
                SaveData();
            }
            int minutes = Mathf.FloorToInt(OneRemainingTime / 60);
            int seconds = Mathf.FloorToInt(OneRemainingTime % 60);
            timerText.text = string.Format("{0:00}:{1:00}", minutes, seconds);
            timerText2.text = string.Format("{0:00}:{1:00}", minutes, seconds);
        }
        else if (SetOneHourInfinite == false && SetThreeHourInfinite == true && SetSixHourInfinite == false)
        {
            HeartText.gameObject.SetActive(false);
            InfinitySymbol.SetActive(true);
            if (ThreeRemainingTime > 0)
            {
                ThreeRemainingTime -= Time.unscaledDeltaTime;
                SaveData();
            }
            else
            {
                SetThreeHourInfinite = false;
                ThreeRemainingTime = 20;
                SaveData();
            }
            int minutes = Mathf.FloorToInt(ThreeRemainingTime / 60);
            int seconds = Mathf.FloorToInt(ThreeRemainingTime % 60);
            timerText.text = string.Format("{0:00}:{1:00}", minutes, seconds);
            timerText2.text = string.Format("{0:00}:{1:00}", minutes, seconds);
        }
        else if (SetOneHourInfinite == false && SetThreeHourInfinite == false && SetSixHourInfinite == true)
        {
            HeartText.gameObject.SetActive(false);
            InfinitySymbol.SetActive(true);
            if (SixRemainingTime > 0)
            {
                SixRemainingTime -= Time.unscaledDeltaTime;
                SaveData();
            }
            else
            {
                SetSixHourInfinite = false;
                SixRemainingTime = 30;
                SaveData();
            }
            int minutes = Mathf.FloorToInt(SixRemainingTime / 60);
            int seconds = Mathf.FloorToInt(SixRemainingTime % 60);
            timerText.text = string.Format("{0:00}:{1:00}", minutes, seconds);
            timerText2.text = string.Format("{0:00}:{1:00}", minutes, seconds);
        }
        //else if (SetOneHourInfinite == true && SetThreeHourInfinite == true && SetSixHourInfinite == false)
        //{
        //    HeartText.gameObject.SetActive(false);
        //    InfinitySymbol.SetActive(true);
        //    float SumRemainingTime = OneRemainingTime + ThreeRemainingTime;
        //    if (SumRemainingTime > 0)
        //    {
        //        SumRemainingTime -= Time.unscaledDeltaTime;
        //        SaveData();
        //    }
        //    else
        //    {
        //        SetOneHourInfinite = false;
        //        SetThreeHourInfinite = false;
        //        SaveData();
        //    }
        //    int minutes = Mathf.FloorToInt(SumRemainingTime / 60);
        //    int seconds = Mathf.FloorToInt(SumRemainingTime % 60);
        //    timerText.text = string.Format("{0:00}:{1:00}", minutes, seconds);
        //    timerText2.text = string.Format("{0:00}:{1:00}", minutes, seconds);
        //}
        //else if (SetOneHourInfinite == true && SetThreeHourInfinite == false && SetSixHourInfinite == true)
        //{
        //    HeartText.gameObject.SetActive(false);
        //    InfinitySymbol.SetActive(true);
        //    float SumRemainingTime = OneRemainingTime + SixRemainingTime;
        //    if (SumRemainingTime > 0)
        //    {
        //        SumRemainingTime -= Time.unscaledDeltaTime;
        //        SaveData();
        //    }
        //    else
        //    {
        //        SetOneHourInfinite = false;
        //        SetSixHourInfinite = false;
        //        SaveData();
        //    }
        //    int minutes = Mathf.FloorToInt(SumRemainingTime / 60);
        //    int seconds = Mathf.FloorToInt(SumRemainingTime % 60);
        //    timerText.text = string.Format("{0:00}:{1:00}", minutes, seconds);
        //    timerText2.text = string.Format("{0:00}:{1:00}", minutes, seconds);
        //}
        //else if (SetOneHourInfinite == false && SetThreeHourInfinite == true && SetSixHourInfinite == true)
        //{
        //    HeartText.gameObject.SetActive(false);
        //    InfinitySymbol.SetActive(true);
        //    float SumRemainingTime = ThreeRemainingTime + SixRemainingTime;
        //    if (SumRemainingTime > 0)
        //    {
        //        SumRemainingTime -= Time.unscaledDeltaTime;
        //        SaveData();
        //    }
        //    else
        //    {
        //        SetThreeHourInfinite = false;
        //        SetSixHourInfinite = false;
        //        SaveData();
        //    }
        //    int minutes = Mathf.FloorToInt(SumRemainingTime / 60);
        //    int seconds = Mathf.FloorToInt(SumRemainingTime % 60);
        //    timerText.text = string.Format("{0:00}:{1:00}", minutes, seconds);
        //    timerText2.text = string.Format("{0:00}:{1:00}", minutes, seconds);
        //}
        //else if (SetOneHourInfinite == true && SetThreeHourInfinite == true && SetSixHourInfinite == true)
        //{
        //    HeartText.gameObject.SetActive(false);
        //    InfinitySymbol.SetActive(true);
        //    float SumRemainingTime = ThreeRemainingTime + SixRemainingTime + OneRemainingTime;
        //    if (SumRemainingTime > 0)
        //    {
        //        SumRemainingTime -= Time.unscaledDeltaTime;
        //        SaveData();
        //    }
        //    else
        //    {
        //        SetOneHourInfinite = false;
        //        SetThreeHourInfinite = false;
        //        SetSixHourInfinite = false;
        //        SaveData();
        //    }
        //    int minutes = Mathf.FloorToInt(SumRemainingTime / 60);
        //    int seconds = Mathf.FloorToInt(SumRemainingTime % 60);
        //    timerText.text = string.Format("{0:00}:{1:00}", minutes, seconds);
        //    timerText2.text = string.Format("{0:00}:{1:00}", minutes, seconds);
        //}
        if (SCPopUp == true)
        {
            time += FillSpeed * Time.deltaTime;
            FeatureBar.value = Mathf.Lerp(FeatureBar.value, targetProgress, time);

        }
        if (Heart >= 1)
        {
            if (OOLPopUp)
            {
                OffOOL();
                Invoke("ReloadScene", 1f);
            }
        }
        if (HammerBoosterIndex == 0)
        {
            HammerCount.SetActive(false);
            HammerPlus.SetActive(true);
        }
        else if (HammerBoosterIndex >= 1)
        {
            HammerCount.SetActive(true);
            HammerPlus.SetActive(false);
        }
        if (HoleBoosterIndex == 0)
        {
            HoleCount.SetActive(false);
            HolePlus.SetActive(true);
        }
        else if (HoleBoosterIndex >= 1)
        {
            HoleCount.SetActive(true);
            HolePlus.SetActive(false);
        }
        if (BoxBoosterIndex == 0)
        {
            BoxCount.SetActive(false);
            BoxPlus.SetActive(true);
        }
        else if (BoxBoosterIndex >= 1)
        {
            BoxCount.SetActive(true);
            BoxPlus.SetActive(false);
        }
    }

    // Save Data
    public void SaveData()
    {
        PlayerPrefs.SetFloat("HeartPoint", Heart);
        PlayerPrefs.SetFloat("CDTime", remainingTime);
        PlayerPrefs.SetFloat("GoldElement", Gold);
        PlayerPrefs.SetFloat("FeatureElement", targetProgress);
        PlayerPrefs.SetFloat("HammerBoosterElement", HammerBoosterIndex);
        PlayerPrefs.SetFloat("HoleBoosterElement", HoleBoosterIndex);
        PlayerPrefs.SetFloat("BoxBoosterElement", BoxBoosterIndex);
        PlayerPrefs.SetFloat("1CDTime", OneRemainingTime);
        PlayerPrefs.SetFloat("3CDTime", ThreeRemainingTime);
        PlayerPrefs.SetFloat("6CDTime", SixRemainingTime);
        PlayerPrefsExtensions.SetBool("1hInfinite", SetOneHourInfinite);
        PlayerPrefsExtensions.SetBool("3hInfinite", SetThreeHourInfinite);
        PlayerPrefsExtensions.SetBool("6hInfinite", SetSixHourInfinite);
    }
    // Quit Game
    public void Quit()
    {
        Application.Quit();
    }

    // Load Level
    public void ReloadScene()
    {
        SceneManager.LoadSceneAsync(SceneManager.GetActiveScene().buildIndex);
    }
    public void LoadNextLevel()
    {
        SceneManager.LoadSceneAsync(SceneManager.GetActiveScene().buildIndex + 1);
    }
    // Admin Cheat
    public void CheatGold()
    {
        Gold -= 10000;
        SaveData();
    }
    public void ResetFeature()
    {
        targetProgress = 0;
        SaveData();
    }
    public void BoosterDown()
    {
        HammerBoosterIndex -= 100;
        HoleBoosterIndex -= 100;
        BoxBoosterIndex -= 100;
        SaveData();
    }
}


